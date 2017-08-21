import UIKit

class ListBrandFakeGateway: ListBrandGateway {
    func allBrands(_ completionHandler: (Result<[Brand], BrandError>) -> Void) {
        let result = Result<[Brand], BrandError>.success([Brand(name: "Fiat")])
        return completionHandler(result)
    }
}

final class ChooseBrandController: UIViewController {

    private var chooseBrandView: ChooseBrandView!
    private var carsRouter: CarsRouter!

    private lazy var listBrandUsecase: ListBrandsUsecase = {
        let usecase = ListBrandsUsecase(listBrandGateway: ListBrandFakeGateway(),
                                        listBrandPresenter: self.chooseBrandView)
        return usecase
    }()

    init(carsRouter: CarsRouter) {
        self.carsRouter = carsRouter
        super.init(nibName: nil, bundle: nil)
        chooseBrandView = ChooseBrandView(parentView: view, actions: [.didSelectBrand: didSelectBrand])
        listBrandUsecase.list()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: ChooseBrandController.self))
    }

    private func didSelectBrand(brand: Brand) {
        carsRouter.carForm(withBrand: brand)
    }

}
