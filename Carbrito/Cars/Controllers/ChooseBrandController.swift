import UIKit

final class ChooseBrandController: UIViewController {

    private var mainView: ChooseBrandView!
    private var carsRouter: CarsRouter!
    private lazy var listBrandUsecase: ListBrandsUsecase = ListBrandsUsecaseFactory.make(presenter: mainView)

    init(carsRouter: CarsRouter) {
        self.carsRouter = carsRouter
        super.init(nibName: nil, bundle: nil)
        mainView = ChooseBrandView(parentView: view, actions: [.didSelectBrand: didSelectBrand])
        listBrandUsecase.list()
        title = String.Navigation.Title.chooseBrand
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: ChooseBrandController.self))
    }

    private func didSelectBrand(brand: Brand) {
        carsRouter.carForm(withBrand: brand)
    }

}
