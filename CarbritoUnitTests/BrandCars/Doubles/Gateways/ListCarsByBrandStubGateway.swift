@testable import Carbrito

final class ListCarsByBrandStubGateway: ListCarsByBrandGateway {

    var didCallBrandsByName = false
    var setupCompletionHandlerResult: Result<[Car], CarError>!

    func brands(byBrandName brandName: String, _ completionHandler: (Result<[Car], CarError>) -> Void) {
        didCallBrandsByName = true
        completionHandler(setupCompletionHandlerResult)
    }

}
