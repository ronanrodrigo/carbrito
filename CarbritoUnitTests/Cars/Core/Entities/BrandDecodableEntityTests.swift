import XCTest
@testable import Carbrito

class BrandDecodableEntityTests: XCTestCase {

    private lazy var brandsData: Data = loadJson(fromFileName: "Brands")
    private let firstBrandName = "Fiat"

    func testDecodeBrandEntityFromJsonWhenJsonAreCorrect() {
        let brands: [BrandDecodableEntity] = JSONDecoder().decode(data: brandsData)

        let firstBrand = brands[0]
        let totalBrands = brands.count

        XCTAssertEqual(firstBrand.name, firstBrandName)
        XCTAssertEqual(totalBrands, 2)
    }

}
