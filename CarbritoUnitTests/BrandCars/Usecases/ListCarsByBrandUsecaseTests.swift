import XCTest
@testable import Carbrito

final class ListCarsByBrandUsecaseTests: XCTestCase {

    private var gateway: ListCarsByBrandStubGateway!
    private var presenter: ListCarsByBrandStubPresenter!
    private var usecase: ListCarsByBrandUsecase!
    private let brandName = "Fiat"

    override func setUp() {
        super.setUp()
        gateway = ListCarsByBrandStubGateway()
        presenter = ListCarsByBrandStubPresenter()
        usecase = ListCarsByBrandUsecase(listCarsByBrandGateway: gateway, listCarsByBrandPresenter: presenter)
    }

    func testListCarsByBrandNameWhenSuccessThenPresentCars() {
        gateway.setupCompletionHandlerResult = .success([])

        usecase.list(byBrandName: brandName)

        XCTAssertTrue(gateway.didCallBrandsByName)
        XCTAssertTrue(presenter.didPresentCars)
        XCTAssertFalse(presenter.didPresentError)
    }

    func testListCarsByBrandNameWhenFailThenPresentCars() {
        gateway.setupCompletionHandlerResult = .fail(BrandCarError.invalidRequest)

        usecase.list(byBrandName: brandName)

        XCTAssertTrue(gateway.didCallBrandsByName)
        XCTAssertTrue(presenter.didPresentError)
        XCTAssertFalse(presenter.didPresentCars)
    }

}
