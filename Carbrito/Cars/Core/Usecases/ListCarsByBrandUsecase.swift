struct ListCarsByBrandUsecase: Usecase {

    typealias Entity = BrandCar
    private let gateway: ListCarsByBrandGateway
    private(set) var presenter: GenericPresenter<BrandCar>

    init(gateway: ListCarsByBrandGateway, presenter: GenericPresenter<BrandCar>) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func list(byBrandName brandName: String) {
        gateway.brands(byBrandName: brandName, completionHandler)
    }

}
