import XCTest
@testable import Carbrito

class CarModelDecodableEntityTests: XCTestCase {

    private lazy var carModelsData: Data = { return loadJson(fromFileName: "CarModels") }()
    private let firstCarModelName = "147 C/ CL"

    func testDecodeCarModelsEntityFromJsonWhenJsonAreCorrect() {
        let carModels: [CarModelDecodableEntity] = JSONDecoder().decode(data: carModelsData)

        let firstCar = carModels[0]
        let totalCars = carModels.count

        XCTAssertEqual(firstCar.name, firstCarModelName)
        XCTAssertEqual(totalCars, 2)
    }

}
