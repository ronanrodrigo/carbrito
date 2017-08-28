struct ListBrandsUsecaseFactory {

    static func make(presenter: GenericPresenter<Brand>) -> ListBrandsUsecase {
        return ListBrandsUsecase(listBrandGateway: ListBrandGatewayFactory.make(), listBrandPresenter: presenter)
    }

}
