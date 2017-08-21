import UIKit

final class ChooseBrandController: UIViewController {

    private var chooseBrandView: ChooseBrandView!
    private var carsRouter: CarsRouter!
    private lazy var listBrandUsecase: ListBrandsUsecase = ListBrandsUsecaseFactory.make(presenter: chooseBrandView)

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
