struct ListBrandsUsecase {

    private let listBrandGateway: ListBrandGateway
    private let listBrandPresenter: GenericPresenter<Brand>

    init(listBrandGateway: ListBrandGateway, listBrandPresenter: GenericPresenter<Brand>) {
        self.listBrandGateway = listBrandGateway
        self.listBrandPresenter = listBrandPresenter
    }

    func list() {
        listBrandGateway.allBrands(allBrandsOnComplete())
    }

    private func allBrandsOnComplete() -> CompletionHandler<[Brand], CarbritoError> {
        let allBrandsCompletion: CompletionHandler<[Brand], CarbritoError> = { result in
            switch result {
            case .success(let brands): self.present(brands: brands)
            case .fail(let error): self.listBrandPresenter.present(error: error)
            }
        }
        return allBrandsCompletion
    }

    private func present(brands: [Brand]) {
        if brands.isEmpty {
            self.listBrandPresenter.presentEmpty()
        } else {
            self.listBrandPresenter.present(entities: brands)
        }
    }
}
