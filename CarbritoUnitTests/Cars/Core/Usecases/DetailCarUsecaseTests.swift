import XCTest
@testable import Carbrito

final class DetailCarUsecaseTests: XCTestCase {

    private var detailCarGateway: DetailCarStubGateway!
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
        detailCarGateway = DetailCarStubGateway()
        usecase = DetailCarUsecase(detailCarGateway: detailCarGateway, detailCarPresenter: presenter)
    }

    func testDetailByCodeAndYearWhenSuccessThenPresentCar() {
        detailCarGateway.setupCompletionHandlerResult = Result.success([car])

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertTrue(detailCarGateway.didCallDetailByCodeAndYear)
        XCTAssertTrue(didCallPresentEntities)
        XCTAssertFalse(didCallPresentError)
    }

    func testDetailByCodeAndYearWhenSuccessWithEmptyListThenPresentEmpty() {
        detailCarGateway.setupCompletionHandlerResult = Result.success([])

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertTrue(detailCarGateway.didCallDetailByCodeAndYear)
        XCTAssertTrue(didCallPresentEmpty)
        XCTAssertFalse(didCallPresentEntities)
        XCTAssertFalse(didCallPresentError)
    }

    func testDetailByCodeAndYearWhenSuccessThenPresentCarWithCorrectCar() {
        detailCarGateway.setupCompletionHandlerResult = Result.success([car])

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertNotNil(didCallPresentEntities)
        XCTAssertEqual(didCallPresentWithCars[0].code, car.code)
    }

    func testDetailByCodeAndYearWhenFailThenPresentError() {
        let error = CarbritoError.cast
        detailCarGateway.setupCompletionHandlerResult = Result.fail(CarbritoError.other(error))

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertTrue(detailCarGateway.didCallDetailByCodeAndYear)
        XCTAssertTrue(didCallPresentError)
        XCTAssertFalse(didCallPresentEntities)
    }

}
