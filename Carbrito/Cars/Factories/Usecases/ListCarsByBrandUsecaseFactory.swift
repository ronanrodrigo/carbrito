struct ListCarsByBrandUsecaseFactory {

    static func make(presenter: ListCarsByBrandPresenter) -> ListCarsByBrandUsecase {
        return ListCarsByBrandUsecase(listCarsByBrandGateway: ListCarsByBrandGatewayFactory.make(),
                                      listCarsByBrandPresenter: presenter)
    }

}
