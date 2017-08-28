struct DetailCarUsecase: Usecase {

    typealias Entity = Car
    private let detailCarGateway: DetailCarGateway
    private(set) var presenter: GenericPresenter<Car>

    init(detailCarGateway: DetailCarGateway, detailCarPresenter: GenericPresenter<Car>) {
        self.detailCarGateway = detailCarGateway
        self.presenter = detailCarPresenter
    }

    func detail(byCode code: String, andYear year: String) {
        detailCarGateway.detail(byCode: code, andYear: year, completionHandler)
    }

}
