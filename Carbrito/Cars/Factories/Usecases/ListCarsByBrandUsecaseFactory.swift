struct ListCarsByBrandUsecaseFactory {

    static func make(presenter: GenericPresenter<BrandCar>) -> ListCarsByBrandUsecase {
        return ListCarsByBrandUsecase(listCarsByBrandGateway: ListCarsByBrandGatewayFactory.make(),
                                      listCarsByBrandPresenter: presenter)
    }

}
