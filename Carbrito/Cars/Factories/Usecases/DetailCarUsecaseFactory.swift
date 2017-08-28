struct DetailCarUsecaseFactory {

    static func make(presenter: GenericPresenter<Car>) -> DetailCarUsecase {
        return DetailCarUsecase(gateway: DetailCarGatewayFactory.make(), presenter: presenter)
    }

}
