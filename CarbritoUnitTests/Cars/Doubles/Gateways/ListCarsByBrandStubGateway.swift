@testable import Carbrito

final class ListCarsByBrandStubGateway: ListCarsByBrandGateway {

    var didCallBrandsByName = false
    var setupCompletionHandlerResult: Result<[BrandCar], BrandCarError>!

    func brands(byBrandName brandName: String, _ completionHandler: (Result<[BrandCar], BrandCarError>) -> Void) {
        didCallBrandsByName = true
        completionHandler(setupCompletionHandlerResult)
    }

}
