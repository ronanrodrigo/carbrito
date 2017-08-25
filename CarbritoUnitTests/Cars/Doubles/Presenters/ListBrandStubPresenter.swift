@testable import Carbrito

class ListBrandStubPresenter: ListBrandPresenter {

    var didCallPresentBrands = false
    var didCallPresentError = false
    var didCallPresentEmpty = false

    func present(brands: [Brand]) {
        didCallPresentBrands = true
    }

    func present(error: CarbritoError) {
        didCallPresentError = true
    }

    func presentEmpty() {
        didCallPresentEmpty = true
    }
}
