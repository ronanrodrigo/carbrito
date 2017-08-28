struct GetRequestFactory {

    static func make() -> GetRequestable {
        return GetRequest()
    }

}
