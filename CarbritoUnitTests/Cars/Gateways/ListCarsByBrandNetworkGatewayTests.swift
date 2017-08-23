import XCTest
@testable import Carbrito

final class ListCarsByBrandNetworkGatewayTests: XCTestCase {

    private var gateway: ListCarsByBrandNetworkGateway!
    private var getRequest: GetFakeRequest!

    private lazy var data = loadJson(fromFileName: "BrandCars")
    private lazy var decodables: [BrandCarDecodableEntity] = JSONDecoder().decode(data: data)
    private lazy var brandCars = decodables.map({ BrandCar(name: $0.name, code: $0.code, year: $0.year) })

    override func setUp() {
        super.setUp()
        getRequest = GetFakeRequest()
        gateway = ListCarsByBrandNetworkGateway(getRequest: getRequest)
    }

    func testAllBrandsWhenSuccessResponseWithDataThenGenerateSuccessResult() {
        var returnedBrands: [BrandCar] = []
        getRequest.setupCompletionHandlerData = data

        gateway.brands(byBrandName: "Fiat") { result in
            switch result {
            case .success(let brands): returnedBrands = brands
            default: return
            }
        }

        XCTAssertEqual(returnedBrands.count, brandCars.count)
        XCTAssertEqual(returnedBrands.first?.name, brandCars.first?.name)
    }

    func testAllBrandsWhenFailResponseWithDataThenGenerateFailResult() {
        var returnedError: BrandCarError?
        getRequest.setupCompletionHandlerError = AnyError.any

        gateway.brands(byBrandName: "Fiat") { result in
            switch result {
            case .fail(let error): returnedError = error
            default: return
            }
        }

        XCTAssertNotNil(returnedError)
        XCTAssertEqual(returnedError!.rawValue, BrandCarError.invalidRequest(nil).rawValue)
    }

    func testAllBrandsWhenSuccessResponseWithInvalidDataThenGenerateFailResult() {
        var returnedError: BrandCarError?
        getRequest.setupCompletionHandlerData = loadJson(fromFileName: "Invalid")

        gateway.brands(byBrandName: "Fiat") { result in
            switch result {
            case .fail(let error): returnedError = error
            default: return
            }
        }

        XCTAssertNotNil(returnedError)
        XCTAssertEqual(returnedError!.rawValue, BrandCarError.castFail.rawValue)
    }

}
