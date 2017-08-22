struct ListBrandGatewayFactory {

    static func make() -> ListBrandGateway {
        return ListBrandNetworkGateway(getRequest: GetRequestFactory.make())
    }

}
