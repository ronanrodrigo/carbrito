import UIKit

final class CarsNavigationViewControllerRouter: CarsRouter {

    private let window: UIWindow
    private weak var rootViewController: CreateCarController?
    private let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        rootViewController = CreateCarControllerFactory.make()
        navigationController = UINavigationController(rootViewController: rootViewController!)
    }

    func root() {
        rootViewController?.carsRouter = self
        navigationController.navigationBar.tintColor = .primary
        window.backgroundColor = .white
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func brandList() {
        let chooseBrandViewController = ChooseBrandController(carsRouter: self)
        navigationController.pushViewController(chooseBrandViewController, animated: true)
    }

    func carForm(withBrand brand: Brand) {
        rootViewController?.brand = brand
        navigationController.popViewController(animated: true)
    }

}
