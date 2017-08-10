import XCTest
@testable import Carbrito

class CarDecodableEntityTests: XCTestCase {

    private lazy var carsData: Data = { return loadJson(fromFileName: "Cars") }()
    private let firstCarName = "147 C/ CL"

    func testDecodeCarEntityFromJsonWhenJsonAreCorrect() {
        let cars: [CarDecodableEntity] = JSONDecoder().decode(data: carsData)

        let firstCar = cars[0]
        let totalCars = cars.count

        XCTAssertEqual(firstCar.name, firstCarName)
        XCTAssertEqual(totalCars, 1)
    }

}
