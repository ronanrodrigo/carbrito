@testable import Carbrito

final class DetailCarStubGateway: DetailCarGateway {

    var didCallDetailByCodeAndYear = false
    var setupCompletionHandlerResult: Result<[Car], CarbritoError>!

    func detail(byCode code: String, andYear year: String,
                _ completionHandler: @escaping (Result<[Car], CarbritoError>) -> Void) {
        didCallDetailByCodeAndYear = true
        completionHandler(setupCompletionHandlerResult)
    }

}
