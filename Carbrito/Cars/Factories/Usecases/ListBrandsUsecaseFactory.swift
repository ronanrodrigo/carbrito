struct ListBrandsUsecaseFactory {

    static func make(presenter: ListBrandPresenter) -> ListBrandsUsecase {
        return ListBrandsUsecase(listBrandGateway: ListBrandGatewayFactory.make(), listBrandPresenter: presenter)
    }

}
