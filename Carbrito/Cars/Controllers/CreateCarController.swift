import UIKit

final class CreateCarController: UIViewController {

    private var mainView: CarFormView!
    var carsRouter: CarsRouter!

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

    func didSelect(brand: Brand) {
        mainView.didChoose(brand: brand)
    }

}
