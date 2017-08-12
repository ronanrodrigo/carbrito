import XCTest
@testable import Carbrito

class ListBrandsUsecaseTests: XCTestCase {

    var gateway: ListBrandStubGateway!
    var presenter: ListBrandStubPresenter!
    var usecase: ListBrandsUsecase!

    override func setUp() {
        super.setUp()
        gateway = ListBrandStubGateway()
        presenter = ListBrandStubPresenter()
        usecase = ListBrandsUsecase(listBrandGateway: gateway, listBrandPresenter: presenter)
    }

    func testListBrandsWhenSuccessThenPresentBrands() {
        let brand = Brand(name: "Fiat")
        gateway.setupCompletionHandlerResult = .success([brand])

        usecase.list()

        XCTAssertTrue(gateway.didCallBrands)
        XCTAssertTrue(presenter.didCallPresentBrands)
        XCTAssertFalse(presenter.didCallPresentError)
        XCTAssertFalse(presenter.didCallPresentEmpty)
    }

    func testListBrandsWhenSuccessWithEmptyListThenPresentBrands() {
        gateway.setupCompletionHandlerResult = .success([])

        usecase.list()

        XCTAssertTrue(gateway.didCallBrands)
        XCTAssertTrue(presenter.didCallPresentEmpty)
        XCTAssertFalse(presenter.didCallPresentBrands)
        XCTAssertFalse(presenter.didCallPresentError)
    }

    func testListBrandsWhenFailThenPresentError() {
        gateway.setupCompletionHandlerResult = .fail(BrandError.invalidRequest)

        usecase.list()

        XCTAssertTrue(gateway.didCallBrands)
        XCTAssertTrue(presenter.didCallPresentError)
        XCTAssertFalse(presenter.didCallPresentBrands)
    }
}
