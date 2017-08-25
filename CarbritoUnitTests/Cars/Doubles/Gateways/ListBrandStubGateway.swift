@testable import Carbrito

class ListBrandStubGateway: ListBrandGateway {

    var didCallBrands = false
    var setupCompletionHandlerResult: Result<[Brand], CarsError>!

    func allBrands(_ completionHandler: @escaping CompletionHandler<[Brand], CarsError>) {
        didCallBrands = true
        completionHandler(setupCompletionHandlerResult)
    }

}
