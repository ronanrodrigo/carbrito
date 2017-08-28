import XCTest
@testable import Carbrito

class ListBrandsUsecaseTests: XCTestCase {

    var gateway: ListBrandStubGateway!
    var usecase: ListBrandsUsecase!

    private var didCallPresentEntities = false
    private var didCallPresentError = false
    private var didCallPresentEmpty = false

    private lazy var presenter: GenericPresenter<Brand> = GenericPresenter(onSuccess: { _ in
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
        gateway = ListBrandStubGateway()
        usecase = ListBrandsUsecase(listBrandGateway: gateway, listBrandPresenter: presenter)
    }

    func testListBrandsWhenSuccessThenPresentBrands() {
        let brand = Brand(name: "Fiat")
        gateway.setupCompletionHandlerResult = .success([brand])

        usecase.list()

        XCTAssertTrue(gateway.didCallBrands)
        XCTAssertTrue(didCallPresentEntities)
        XCTAssertFalse(didCallPresentError)
        XCTAssertFalse(didCallPresentEmpty)
    }

    func testListBrandsWhenSuccessWithEmptyListThenPresentBrands() {
        gateway.setupCompletionHandlerResult = .success([])

        usecase.list()

        XCTAssertTrue(gateway.didCallBrands)
        XCTAssertTrue(didCallPresentEmpty)
        XCTAssertFalse(didCallPresentEntities)
        XCTAssertFalse(didCallPresentError)
    }

    func testListBrandsWhenFailThenPresentError() {
        let error = CarbritoError.cast
        gateway.setupCompletionHandlerResult = .fail(CarbritoError.other(error))

        usecase.list()

        XCTAssertTrue(gateway.didCallBrands)
        XCTAssertTrue(didCallPresentError)
        XCTAssertFalse(didCallPresentEntities)
    }
}
