import XCTest
@testable import Carbrito

final class ListBrandNetworkGatewayTests: XCTestCase {

    private var gateway: ListBrandNetworkGateway!
    private var getRequest: GetFakeRequest!

    private lazy var brandData = loadJson(fromFileName: "Brands")
    private lazy var brandsDecodable: [BrandDecodableEntity] = JSONDecoder().decode(data: brandData)
    private lazy var brands = brandsDecodable.map({ Brand(name: $0.name) })

    override func setUp() {
        super.setUp()
        getRequest = GetFakeRequest()
        gateway = ListBrandNetworkGateway(getRequest: getRequest)
    }

    func testAllBrandsWhenSuccessResponseWithDataThenGenerateSuccessResult() {
        var returnedBrands: [Brand] = []
        getRequest.setupCompletionHandlerData = brandData

        gateway.allBrands { result in
            switch result {
            case .success(let brands): returnedBrands = brands
            default: return
            }
        }

        XCTAssertEqual(returnedBrands.count, brands.count)
        XCTAssertEqual(returnedBrands.first?.name, brands.first?.name)
    }

    func testAllBrandsWhenFailResponseWithDataThenGenerateFailResult() {
        var returnedError: CarsError?
        getRequest.setupCompletionHandlerError = CarsError.other(nil)

        gateway.allBrands { result in
            switch result {
            case .fail(let error): returnedError = error
            default: return
            }
        }

        XCTAssertNotNil(returnedError)
        XCTAssertEqual(returnedError!.rawValue, CarsError.other(nil).rawValue)
    }

    func testAllBrandsWhenSuccessResponseWithInvalidDataThenGenerateFailResult() {
        var returnedError: CarsError?
        getRequest.setupCompletionHandlerData = loadJson(fromFileName: "Invalid")

        gateway.allBrands { result in
            switch result {
            case .fail(let error): returnedError = error
            default: return
            }
        }

        XCTAssertNotNil(returnedError)
        XCTAssertEqual(returnedError!.rawValue, CarsError.cast.rawValue)
    }

}
