import Foundation
@testable import Carbrito

class GetFakeRequest: GetRequestable {

    var setupCompletionHandlerData: Data?
    var setupCompletionHandlerError: CarbritoError?

    func get(url: String, completionHandler: @escaping (Data?, CarbritoError?) -> Void) {
        completionHandler(setupCompletionHandlerData, setupCompletionHandlerError)
    }

}
