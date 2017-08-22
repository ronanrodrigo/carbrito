struct DetailCarGatewayFactory {

    static func make() -> DetailCarGateway {
        return DetailCarNetworkGateway(getRequest: GetRequestFactory.make())
    }

}
