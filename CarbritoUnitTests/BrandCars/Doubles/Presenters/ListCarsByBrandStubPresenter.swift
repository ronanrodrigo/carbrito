@testable import Carbrito

final class ListCarsByBrandStubPresenter: ListCarsByBrandPresenter {

    var didPresentCars = false
    var didPresentError = false

    func present(cars: [BrandCar]) {
        didPresentCars = true
    }

    func present(error: BrandCarError) {
        didPresentError = true
    }

}
