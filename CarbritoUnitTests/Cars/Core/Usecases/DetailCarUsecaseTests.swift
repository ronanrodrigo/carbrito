import XCTest
@testable import Carbrito

final class DetailCarUsecaseTests: XCTestCase {

    private var detailCarGateway: DetailCarStubGateway!
    private var detailCarPresenter: DetailCarStubPresenter!
    private var usecase: DetailCarUsecase!
    private var car = Car(name: "147", code: "001124-0", year: "1986", brand: "Fiat", price: 0.0, tax: 0.0)

    override func setUp() {
        super.setUp()
        detailCarGateway = DetailCarStubGateway()
        detailCarPresenter = DetailCarStubPresenter()
        usecase = DetailCarUsecase(detailCarGateway: detailCarGateway, detailCarPresenter: detailCarPresenter)
    }

    func testDetailByCodeAndYearWhenSuccessThenPresentCar() {
        detailCarGateway.setupCompletionHandlerResult = Result.success([car])

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertTrue(detailCarGateway.didCallDetailByCodeAndYear)
        XCTAssertTrue(detailCarPresenter.didCallPresentCar)
        XCTAssertFalse(detailCarPresenter.didCallPresentError)
    }

    func testDetailByCodeAndYearWhenSuccessWithEmptyListThenPresentEmpty() {
        detailCarGateway.setupCompletionHandlerResult = Result.success([])

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertTrue(detailCarGateway.didCallDetailByCodeAndYear)
        XCTAssertTrue(detailCarPresenter.didCallPresentEmpty)
        XCTAssertFalse(detailCarPresenter.didCallPresentCar)
        XCTAssertFalse(detailCarPresenter.didCallPresentError)
    }

    func testDetailByCodeAndYearWhenSuccessThenPresentCarWithCorrectCar() {
        detailCarGateway.setupCompletionHandlerResult = Result.success([car])

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertNotNil(detailCarPresenter.didCallPresentWithCars)
        XCTAssertEqual(detailCarPresenter.didCallPresentWithCars![0].code, car.code)
    }

    func testDetailByCodeAndYearWhenFailThenPresentError() {
        let error = CarError.castFail
        detailCarGateway.setupCompletionHandlerResult = Result.fail(CarError.invalidRequest(error))

        usecase.detail(byCode: car.code, andYear: car.year)

        XCTAssertTrue(detailCarGateway.didCallDetailByCodeAndYear)
        XCTAssertTrue(detailCarPresenter.didCallPresentError)
        XCTAssertFalse(detailCarPresenter.didCallPresentCar)
    }

}
