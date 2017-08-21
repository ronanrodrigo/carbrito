struct ListBrandGatewayFactory {

    static func make() -> ListBrandGateway {
        return ListBrandFakeGateway()
    }

}
