enum CarError: Error {
    case invalidRequest(Error?)
    case castFail
}
