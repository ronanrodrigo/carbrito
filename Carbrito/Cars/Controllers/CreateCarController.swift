import UIKit

final class CreateCarController: UIViewController {

    private var mainView: CarFormView!
    var carsRouter: CarsRouter!
    var brand: Brand? {
        didSet { didSelect(brand: brand) }
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        title = String.Carbrito.title
        mainView = CarFormView(parentView: view, actions: [.selectBrand: selectBrand])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: CreateCarController.self))
    }

    private func selectBrand() {
        carsRouter.brandList()
    }

    private func didSelect(brand: Brand?) {
        guard let brand = brand else { return }
        mainView.didChoose(brand: brand)
    }

}
