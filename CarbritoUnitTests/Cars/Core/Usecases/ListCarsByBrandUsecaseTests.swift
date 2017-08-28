import XCTest
@testable import Carbrito

final class ListCarsByBrandUsecaseTests: XCTestCase {

    private var gateway: ListCarsByBrandStubGateway!
    private var usecase: ListCarsByBrandUsecase!
    private let brandName = "Fiat"

    private var didCallPresentEntities = false
    private var didCallPresentError = false
    private var didCallPresentEmpty = false

    private lazy var presenter: GenericPresenter<BrandCar> = GenericPresenter(onSuccess: { _ in
        self.didCallPresentEntities = true
    }, onError: { _ in
        self.didCallPresentError = true
    }, onEmpty: {
        self.didCallPresentEmpty = true
    })

    override func setUp() {
        super.setUp()
        didCallPresentEntities = false
        didCallPresentError = false
        didCallPresentEmpty = false
        gateway = ListCarsByBrandStubGateway()
        usecase = ListCarsByBrandUsecase(gateway: gateway, presenter: presenter)
    }

    func testListCarsByBrandNameWhenSuccessThenPresentCars() {
        let brandCar = BrandCar(name: "147", code: "001124-0", year: "1986")
        gateway.setupCompletionHandlerResult = .success([brandCar])

        usecase.list(byBrandName: brandName)

        XCTAssertTrue(gateway.didCallBrandsByName)
        XCTAssertTrue(didCallPresentEntities)
        XCTAssertFalse(didCallPresentError)
        XCTAssertFalse(didCallPresentEmpty)
    }

    func testListCarsByBrandNameWhenSuccessWithEmptyListThenPresentEmpty() {
        gateway.setupCompletionHandlerResult = .success([])

        usecase.list(byBrandName: brandName)

        XCTAssertTrue(gateway.didCallBrandsByName)
        XCTAssertTrue(didCallPresentEmpty)
        XCTAssertFalse(didCallPresentEntities)
        XCTAssertFalse(didCallPresentError)
    }

    func testListCarsByBrandNameWhenFailThenPresentCars() {
        let error = CarbritoError.cast
        gateway.setupCompletionHandlerResult = .fail(CarbritoError.other(error))

        usecase.list(byBrandName: brandName)

        XCTAssertTrue(gateway.didCallBrandsByName)
        XCTAssertTrue(didCallPresentError)
        XCTAssertFalse(didCallPresentEntities)
    }

}
