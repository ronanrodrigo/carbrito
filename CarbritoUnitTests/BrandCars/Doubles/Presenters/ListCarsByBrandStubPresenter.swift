@testable import Carbrito

final class ListCarsByBrandStubPresenter: ListCarsByBrandPresenter {

    var didPresentCars = false
    var didPresentError = false
    var didCallPresentEmpty = false

    func present(cars: [BrandCar]) {
        didPresentCars = true
    }

    func present(error: BrandCarError) {
        didPresentError = true
    }

    func presentEmpty() {
        didCallPresentEmpty = true
    }

}
