@testable import Carbrito

final class DetailCarStubGateway: DetailCarGateway {

    var didCallDetailByCodeAndYear = false
    var setupCompletionHandlerResult: Result<[Car], CarError>!

    func detail(byCode code: String, andYear year: String, _ completionHandler: (Result<[Car], CarError>) -> Void) {
        didCallDetailByCodeAndYear = true
        completionHandler(setupCompletionHandlerResult)
    }

}
