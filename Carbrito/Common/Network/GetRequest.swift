import Foundation
import UIKit
import ReachabilitySwift

protocol GetRequestable {
    func get(url: String, completionHandler: @escaping (Data?, CarbritoError?) -> Void)
}

struct GetRequest: GetRequestable {

    private static let reachability = Reachability()

    func get(url: String, completionHandler: @escaping (Data?, CarbritoError?) -> Void) {

        if GetRequest.reachability?.currentReachabilityStatus == .notReachable {
            completionHandler(nil, CarbritoError.offline)
            return
        }

        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let fullUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: fullUrl) else { return }
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async { UIApplication.shared.isNetworkActivityIndicatorVisible = false }
            completionHandler(data, CarbritoError.other(error))
        }

        task.resume()
        session.finishTasksAndInvalidate()
    }

}
