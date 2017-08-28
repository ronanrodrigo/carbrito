struct ListBrandsUsecase: Usecase {

    typealias Entity = Brand
    private let gateway: ListBrandGateway
    private(set) var presenter: GenericPresenter<Brand>

    init(gateway: ListBrandGateway, presenter: GenericPresenter<Brand>) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func list() {
        gateway.allBrands(completionHandler)
    }

}
