import XCTest
@testable import Carbrito

final class DetailCarNetworkGatewayTests: XCTestCase {

    private var gateway: DetailCarNetworkGateway!
    private var getRequest: GetFakeRequest!

    private lazy var data = loadJson(fromFileName: "Cars")
    private lazy var decodables: [CarDecodableEntity] = JSONDecoder().decode(data: data)
    private lazy var cars = decodables.map({ Car(name: $0.name, code: $0.code, year: $0.year, brand: $0.brand,
                                                 price: $0.price, tax: $0.tax) })

    override func setUp() {
        super.setUp()
        getRequest = GetFakeRequest()
        gateway = DetailCarNetworkGateway(getRequest: getRequest)
    }

    func testAllBrandsWhenSuccessResponseWithDataThenGenerateSuccessResult() {
        var returnedCars: [Car] = []
        getRequest.setupCompletionHandlerData = data

        gateway.detail(byCode: "", andYear: "0") { result in
            switch result {
            case .success(let cars): returnedCars = cars
            default: return
            }
        }

        XCTAssertEqual(returnedCars.count, cars.count)
        XCTAssertEqual(returnedCars.first?.name, cars.first?.name)
        XCTAssertEqual(returnedCars.first?.code, cars.first?.code)
    }

    func testAllBrandsWhenFailResponseWithDataThenGenerateFailResult() {
        var returnedError: CarError?
        getRequest.setupCompletionHandlerError = AnyError.any

        gateway.detail(byCode: "", andYear: "0") { result in
            switch result {
            case .fail(let error): returnedError = error
            default: return
            }
        }

        XCTAssertNotNil(returnedError)
        XCTAssertEqual(returnedError!.rawValue, CarError.invalidRequest(nil).rawValue)
    }

    func testAllBrandsWhenSuccessResponseWithInvalidDataThenGenerateFailResult() {
        var returnedError: CarError?
        getRequest.setupCompletionHandlerData = loadJson(fromFileName: "Invalid")

        gateway.detail(byCode: "", andYear: "0") { result in
            switch result {
            case .fail(let error): returnedError = error
            default: return
            }
        }

        XCTAssertNotNil(returnedError)
        XCTAssertEqual(returnedError!.rawValue, CarError.castFail.rawValue)
    }

}
