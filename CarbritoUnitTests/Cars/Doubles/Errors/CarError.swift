@testable import Carbrito

extension CarError {
    var rawValue: Int {
        switch self {
        case .castFail: return 1
        case .invalidRequest: return 2
        }
    }
}
