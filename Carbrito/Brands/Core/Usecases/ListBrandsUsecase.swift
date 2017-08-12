struct ListBrandsUsecase {

    private let listBrandGateway: ListBrandGateway
    private let listBrandPresenter: ListBrandPresenter

    init(listBrandGateway: ListBrandGateway, listBrandPresenter: ListBrandPresenter) {
        self.listBrandGateway = listBrandGateway
        self.listBrandPresenter = listBrandPresenter
    }

    func list() {
        listBrandGateway.allBrands(allBrandsOnComplete())
    }

    private func allBrandsOnComplete() -> CompletionHandler<[Brand], BrandError> {
        let allBrandsCompletion: CompletionHandler<[Brand], BrandError> = { result in
            switch result {
            case .success(let brands):
                if brands.isEmpty {
                    self.listBrandPresenter.presentEmpty()
                } else {
                    self.listBrandPresenter.present(brands: brands)
                }
            case .fail(let error): self.listBrandPresenter.present(error: error)
            }
        }
        return allBrandsCompletion
    }

}
