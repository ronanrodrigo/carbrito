import UIKit

final class ChooseCarByBrandController: UIViewController {

    private var chooseCarByBrandView: ChooseCarByBrandView!
    private var carsRouter: CarsRouter!
    private lazy var listCarByBrandUsecase: ListCarsByBrandUsecase = ListCarsByBrandUsecaseFactory.make(
        presenter: self.chooseCarByBrandView)

    init(carsRouter: CarsRouter, brand: Brand) {
        self.carsRouter = carsRouter
        super.init(nibName: nil, bundle: nil)
        chooseCarByBrandView = ChooseCarByBrandView(parentView: view, actions: [.didSelectBrandCar: didSelectBrandCar])
        listCarByBrandUsecase.list(byBrandName: brand.name)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: ChooseCarByBrandController.self))
    }

    private func didSelectBrandCar(brandCar: BrandCar) {
        carsRouter.carForm(withBrandCar: brandCar)
    }

}
