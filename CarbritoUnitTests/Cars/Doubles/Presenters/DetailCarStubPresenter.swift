@testable import Carbrito

final class DetailCarStubPresenter: DetailCarPresenter {

    var didCallPresentCar = false
    var didCallPresentWithCar: Car?
    var didCallPresentError = false

    func present(car: Car) {
        didCallPresentWithCar = car
        didCallPresentCar = true
    }

    func present(error: CarError) {
        didCallPresentError = true
    }

}
