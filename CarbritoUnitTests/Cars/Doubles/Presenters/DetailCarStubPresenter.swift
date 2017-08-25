@testable import Carbrito

final class DetailCarStubPresenter: DetailCarPresenter {

    var didCallPresentCar = false
    var didCallPresentWithCars: [Car]?
    var didCallPresentError = false
    var didCallPresentEmpty = false

    func present(cars: [Car]) {
        didCallPresentWithCars = cars
        didCallPresentCar = true
    }

    func present(error: CarbritoError) {
        didCallPresentError = true
    }

    func presentEmpty() {
        didCallPresentEmpty = true
    }

}
