@testable import Carbrito

final class DetailCarStubGateway: DetailCarGateway {

    var didCallDetailByCodeAndYear = false
    var setupCompletionHandlerResult: Result<[Car], CarsError>!

    func detail(byCode code: String, andYear year: String,
                _ completionHandler: @escaping (Result<[Car], CarsError>) -> Void) {
        didCallDetailByCodeAndYear = true
        completionHandler(setupCompletionHandlerResult)
    }

}
