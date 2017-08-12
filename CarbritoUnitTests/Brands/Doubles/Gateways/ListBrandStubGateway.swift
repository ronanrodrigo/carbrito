@testable import Carbrito

class ListBrandStubGateway: ListBrandGateway {

    var didCallBrands = false
    var setupCompletionHandlerResult: Result<[Brand], BrandError>!

    func allBrands(_ completionHandler: CompletionHandler<[Brand], BrandError>) {
        didCallBrands = true
        completionHandler(setupCompletionHandlerResult)
    }

}
