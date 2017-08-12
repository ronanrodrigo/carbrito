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
        gateway.setupCompletionHandlerResult = .success([])

        usecase.list()

        XCTAssertTrue(gateway.didCallBrands)
        XCTAssertTrue(presenter.didCallPresentBrands)
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
