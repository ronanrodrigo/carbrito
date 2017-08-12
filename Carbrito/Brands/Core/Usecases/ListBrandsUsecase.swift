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
        let allGamesCompletion: CompletionHandler<[Brand], BrandError> = { result in
            switch result {
            case Result.success(let brands): self.listBrandPresenter.present(brands: brands)
            case Result.fail(let error): self.listBrandPresenter.present(error: error)
            }
        }
        return allGamesCompletion
    }

}
