import XCTest
@testable import Carbrito

final class DetailCarUsecaseTests: XCTestCase {

    private var gateway: DetailCarStubGateway!
    private var usecase: DetailCarUsecase!

    private var car = Car(name: "147", code: "001124-0", year: "1986", brand: "Fiat", price: 0.0, tax: 0.0)
    private var didCallPresentEntities = false
    private var didCallPresentError = false
    private var didCallPresentEmpty = false
    private var didCallPresentWithCars: [Car] = []

    private lazy var presenter: GenericPresenter<Car> = GenericPresenter(onSuccess: { cars in
        self.didCallPresentEntities = true
        self.didCallPresentWithCars = cars
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
        gateway = DetailCarStubGateway()
        usecase = DetailCarUsecase(gateway: gateway, presenter: presenter)
    }

    func testDetailByCodeAndYearWhenSuccessThenPresentCar() {
        gateway.setupCompletionHandlerResult = Result.success([car])

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertTrue(gateway.didCallDetailByCodeAndYear)
        XCTAssertTrue(didCallPresentEntities)
        XCTAssertFalse(didCallPresentError)
    }

    func testDetailByCodeAndYearWhenSuccessWithEmptyListThenPresentEmpty() {
        gateway.setupCompletionHandlerResult = Result.success([])

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertTrue(gateway.didCallDetailByCodeAndYear)
        XCTAssertTrue(didCallPresentEmpty)
        XCTAssertFalse(didCallPresentEntities)
        XCTAssertFalse(didCallPresentError)
    }

    func testDetailByCodeAndYearWhenSuccessThenPresentCarWithCorrectCar() {
        gateway.setupCompletionHandlerResult = Result.success([car])

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertNotNil(didCallPresentEntities)
        XCTAssertEqual(didCallPresentWithCars[0].code, car.code)
    }

    func testDetailByCodeAndYearWhenFailThenPresentError() {
        let error = CarbritoError.cast
        gateway.setupCompletionHandlerResult = Result.fail(CarbritoError.other(error))

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertTrue(gateway.didCallDetailByCodeAndYear)
        XCTAssertTrue(didCallPresentError)
        XCTAssertFalse(didCallPresentEntities)
    }

}
