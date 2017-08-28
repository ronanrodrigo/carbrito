struct DetailCarUsecaseFactory {

    static func make(presenter: GenericPresenter<Car>) -> DetailCarUsecase {
        return DetailCarUsecase(detailCarGateway: DetailCarGatewayFactory.make(), detailCarPresenter: presenter)
    }

}
