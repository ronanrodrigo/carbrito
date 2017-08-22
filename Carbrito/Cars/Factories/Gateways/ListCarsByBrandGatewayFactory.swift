struct ListCarsByBrandGatewayFactory {

    static func make() -> ListCarsByBrandGateway {
        return ListCarsByBrandNetworkGateway(getRequest: GetRequestFactory.make())
    }

}
