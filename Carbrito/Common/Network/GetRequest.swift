import Foundation
import UIKit
import ReachabilitySwift

protocol GetRequestable {
    func get(url: String, completionHandler: @escaping (Data?, CarbritoError?) -> Void)
}

private var getRequestCache: [String: Data] = [:]

final class GetRequest: GetRequestable {

    private let reachability = Reachability()!

    func get(url urlString: String, completionHandler: @escaping (Data?, CarbritoError?) -> Void) {
        if let cachedData = getRequestCache[urlString] {
            return completionHandler(cachedData, nil)
        } else if reachability.currentReachabilityStatus == .notReachable {
            return completionHandler(nil, CarbritoError.offline)
        }

        makeRequest(url: urlString, completionHandler: completionHandler)
    }

    private func makeRequest(url urlString: String, completionHandler: @escaping (Data?, CarbritoError?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let fullUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: fullUrl) else { return }
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async { UIApplication.shared.isNetworkActivityIndicatorVisible = false }
            completionHandler(data, CarbritoError.other(error))
            if let data = data {
                getRequestCache[urlString] = data
            }
        }

        task.resume()
        session.finishTasksAndInvalidate()
    }

}
