struct ListBrandGatewayFactory {

    static func make() -> ListBrandGateway {
        return ListBrandNetworkGateway()
    }

}
