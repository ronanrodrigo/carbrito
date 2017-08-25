@testable import Carbrito

final class ListCarsByBrandStubGateway: ListCarsByBrandGateway {

    var didCallBrandsByName = false
    var setupCompletionHandlerResult: Result<[BrandCar], CarbritoError>!

    func brands(byBrandName brandName: String,
                _ completionHandler: @escaping (Result<[BrandCar], CarbritoError>) -> Void) {
        didCallBrandsByName = true
        completionHandler(setupCompletionHandlerResult)
    }

}
