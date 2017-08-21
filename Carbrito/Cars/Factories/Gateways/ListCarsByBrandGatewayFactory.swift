struct ListCarsByBrandGatewayFactory {

    static func make() -> ListCarsByBrandGateway {
        return ListCarsByBrandFakeGateway()
    }

}
