import Foundation

extension JSONDecoder {

    func decode<T: Decodable>(data: Data) -> T {
        // swiftlint:disable:next force_try
        return try! self.decode(T.self, from: data)
    }

}
