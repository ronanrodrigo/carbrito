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
        let brandCar = BrandCar(name: "147", code: "001124-0", year: "1986")
        gateway.setupCompletionHandlerResult = .success([brandCar])

        usecase.list(byBrandName: brandName)

        XCTAssertTrue(gateway.didCallBrandsByName)
        XCTAssertTrue(presenter.didPresentCars)
        XCTAssertFalse(presenter.didPresentError)
        XCTAssertFalse(presenter.didCallPresentEmpty)
    }

    func testListCarsByBrandNameWhenSuccessWithEmptyListThenPresentEmpty() {
        gateway.setupCompletionHandlerResult = .success([])

        usecase.list(byBrandName: brandName)

        XCTAssertTrue(gateway.didCallBrandsByName)
        XCTAssertTrue(presenter.didCallPresentEmpty)
        XCTAssertFalse(presenter.didPresentCars)
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
