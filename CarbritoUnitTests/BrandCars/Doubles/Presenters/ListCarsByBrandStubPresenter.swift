@testable import Carbrito

final class ListCarsByBrandStubPresenter: ListCarsByBrandPresenter {

    var didPresentCars = false
    var didPresentError = false

    func present(cars: [Car]) {
        didPresentCars = true
    }

    func present(error: CarError) {
        didPresentError = true
    }

}
