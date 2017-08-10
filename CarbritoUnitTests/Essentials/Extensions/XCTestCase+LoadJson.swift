import XCTest

extension XCTestCase {

    func loadJson(fromFileName fileName: String) -> Data {
        let bundle = Bundle(for: BrandDecodableEntityTests.self)
        let filePath = bundle.path(forResource: fileName, ofType:"json")!
        // swiftlint:disable:next force_try
        return try! Data(contentsOf: URL(fileURLWithPath: filePath), options: .uncached)
    }

}
