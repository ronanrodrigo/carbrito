struct ListCarsByBrandUsecaseFactory {

    static func make(presenter: GenericPresenter<BrandCar>) -> ListCarsByBrandUsecase {
        return ListCarsByBrandUsecase(gateway: ListCarsByBrandGatewayFactory.make(),
                                      presenter: presenter)
    }

}
