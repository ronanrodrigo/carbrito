struct ListCarsByBrandUsecase: Usecase {

    typealias Entity = BrandCar
    private let listCarsByBrandGateway: ListCarsByBrandGateway
    private(set) var presenter: GenericPresenter<BrandCar>

    init(listCarsByBrandGateway: ListCarsByBrandGateway, listCarsByBrandPresenter: GenericPresenter<BrandCar>) {
        self.listCarsByBrandGateway = listCarsByBrandGateway
        self.presenter = listCarsByBrandPresenter
    }

    func list(byBrandName brandName: String) {
        listCarsByBrandGateway.brands(byBrandName: brandName, onComplete())
    }

}
