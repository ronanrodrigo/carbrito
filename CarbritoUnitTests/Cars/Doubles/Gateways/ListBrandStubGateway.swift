@testable import Carbrito

class ListBrandStubGateway: ListBrandGateway {

    var didCallBrands = false
    var setupCompletionHandlerResult: Result<[Brand], CarbritoError>!

    func allBrands(_ completionHandler: @escaping CompletionHandler<[Brand], CarbritoError>) {
        didCallBrands = true
        completionHandler(setupCompletionHandlerResult)
    }

}
