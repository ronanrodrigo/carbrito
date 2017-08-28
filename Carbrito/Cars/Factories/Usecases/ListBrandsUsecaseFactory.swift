struct ListBrandsUsecaseFactory {

    static func make(presenter: GenericPresenter<Brand>) -> ListBrandsUsecase {
        return ListBrandsUsecase(gateway: ListBrandGatewayFactory.make(), presenter: presenter)
    }

}
