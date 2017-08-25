enum CarbritoError: Error {
    case cast
    case offline
    case other(Error?)

    var localizedDescription: String {
        switch self {
        case .cast: return String.CarsError.cast
        case .offline: return String.CarsError.offline
        default: return String.CarsError.other
        }
    }

    var rawValue: Int {
        switch self {
        case .cast: return 1
        case .offline: return 2
        default: return 3
        }
    }

}
