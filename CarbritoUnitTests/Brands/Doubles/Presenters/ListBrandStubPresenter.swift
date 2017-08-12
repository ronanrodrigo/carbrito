@testable import Carbrito

class ListBrandStubPresenter: ListBrandPresenter {

    var didCallPresentBrands = false
    var didCallPresentError = false

    func present(brands: [Brand]) {
        didCallPresentBrands = true
    }

    func present(error: BrandError) {
        didCallPresentError = true
    }

}
