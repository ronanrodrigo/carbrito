import Foundation
@testable import Carbrito

class GetFakeRequest: GetRequestable {

    var setupCompletionHandlerData: Data?
    var setupCompletionHandlerError: Error?

    func get(url: String, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(setupCompletionHandlerData, setupCompletionHandlerError)
    }

}
