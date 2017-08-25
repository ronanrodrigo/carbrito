@testable import Carbrito

final class ListCarsByBrandStubGateway: ListCarsByBrandGateway {

    var didCallBrandsByName = false
    var setupCompletionHandlerResult: Result<[BrandCar], CarsError>!

    func brands(byBrandName brandName: String,
                _ completionHandler: @escaping (Result<[BrandCar], CarsError>) -> Void) {
        didCallBrandsByName = true
        completionHandler(setupCompletionHandlerResult)
    }

}
