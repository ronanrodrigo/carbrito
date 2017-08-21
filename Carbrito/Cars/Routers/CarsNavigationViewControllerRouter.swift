import UIKit

final class CarsNavigationViewControllerRouter: CarsRouter {

    private let window: UIWindow
    private weak var createCarController: CreateCarController?
    private let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        createCarController = CreateCarControllerFactory.make()
        navigationController = UINavigationController(rootViewController: createCarController!)
    }

    func root() {
        createCarController?.carsRouter = self
        navigationController.navigationBar.tintColor = .primary
        window.backgroundColor = .white
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func brandList() {
        let chooseBrandViewController = ChooseBrandController(carsRouter: self)
        navigationController.pushViewController(chooseBrandViewController, animated: true)
    }

    func brandCarList() {
        guard let brand = createCarController?.selectedBrand else { return }
        let chooseBrandCarController = ChooseCarByBrandController(carsRouter: self, brand: brand)
        navigationController.pushViewController(chooseBrandCarController, animated: true)
    }

    func carShow() {
        guard let brandCar = createCarController?.selectedBrandCar else { return }
        let showCarController = ShowCarController(brandCar: brandCar)
        navigationController.pushViewController(showCarController, animated: true)
    }

    func carForm(withBrand brand: Brand) {
        createCarController?.didSelect(brand: brand)
        navigationController.popViewController(animated: true)
    }

    func carForm(withBrandCar brandCar: BrandCar) {
        createCarController?.didSelect(brandCar: brandCar)
        navigationController.popViewController(animated: true)
    }

}
