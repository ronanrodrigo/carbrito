protocol ListBrandPresenter {
    func present(brands: [Brand])
    func present(error: BrandError)
}
