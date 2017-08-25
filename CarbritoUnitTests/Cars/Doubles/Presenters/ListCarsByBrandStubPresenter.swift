@testable import Carbrito

final class ListCarsByBrandStubPresenter: ListCarsByBrandPresenter {

    var didPresentCars = false
    var didPresentError = false
    var didCallPresentEmpty = false

    func present(brandCars: [BrandCar]) {
        didPresentCars = true
    }

    func present(error: CarbritoError) {
        didPresentError = true
    }

    func presentEmpty() {
        didCallPresentEmpty = true
    }

}
