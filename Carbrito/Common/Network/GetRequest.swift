import Foundation

protocol GetRequestable {
    func get(url: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

struct GetRequest: GetRequestable {

    func get(url: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let fullUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: fullUrl) else { return }
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request, completionHandler: completionHandler)

        task.resume()
        session.finishTasksAndInvalidate()
    }

}
