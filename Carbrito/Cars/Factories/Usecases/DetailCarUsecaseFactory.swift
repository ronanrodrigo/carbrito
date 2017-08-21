struct DetailCarUsecaseFactory {

    static func make(presenter: DetailCarPresenter) -> DetailCarUsecase {
        return DetailCarUsecase(detailCarGateway: DetailCarGatewayFactory.make(), detailCarPresenter: presenter)
    }

}
