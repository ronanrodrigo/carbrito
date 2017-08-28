struct DetailCarUsecase: Usecase {

    typealias Entity = Car
    private let gateway: DetailCarGateway
    private(set) var presenter: GenericPresenter<Car>

    init(gateway: DetailCarGateway, presenter: GenericPresenter<Car>) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func detail(byCode code: String, andYear year: String) {
        gateway.detail(byCode: code, andYear: year, completionHandler)
    }

}
