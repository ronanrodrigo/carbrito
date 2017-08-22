import Foundation
import UIKit

protocol GetRequestable {
    func get(url: String, completionHandler: @escaping (Data?, Error?) -> Void)
}

struct GetRequest: GetRequestable {

    func get(url: String, completionHandler: @escaping (Data?, Error?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let fullUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: fullUrl) else { return }
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async { UIApplication.shared.isNetworkActivityIndicatorVisible = false }
            completionHandler(data, error)
        }

        task.resume()
        session.finishTasksAndInvalidate()
    }

}
