struct ListBrandsUsecase: Usecase {

    typealias Entity = Brand
    private let listBrandGateway: ListBrandGateway
    private(set) var presenter: GenericPresenter<Brand>

    init(listBrandGateway: ListBrandGateway, listBrandPresenter: GenericPresenter<Brand>) {
        self.listBrandGateway = listBrandGateway
        self.presenter = listBrandPresenter
    }

    func list() {
        listBrandGateway.allBrands(onComplete())
    }

}
