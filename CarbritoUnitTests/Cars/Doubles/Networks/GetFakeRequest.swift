import Foundation
@testable import Carbrito

class GetFakeRequest: GetRequestable {

    var setupCompletionHandlerData: Data?
    var setupCompletionHandlerError: CarsError?

    func get(url: String, completionHandler: @escaping (Data?, CarsError?) -> Void) {
        completionHandler(setupCompletionHandlerData, setupCompletionHandlerError)
    }

}
