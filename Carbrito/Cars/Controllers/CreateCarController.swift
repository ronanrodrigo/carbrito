import UIKit

final class CreateCarController: UIViewController {

    private var mainView: CarFormView!
    private(set) var selectedBrand: Brand?
    private(set) var selectedBrandCar: BrandCar?
    var carsRouter: CarsRouter!

    init() {
        super.init(nibName: nil, bundle: nil)
        title = String.Carbrito.title
        let actions = [CarFormView.ActionName.selectBrand: selectBrand, .selectCar: selectCar, .showCar: showCar]
        mainView = CarFormView(parentView: view, actions: actions)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: CreateCarController.self))
    }

    private func selectBrand() {
        carsRouter.brandList()
    }

    private func selectCar() {
        carsRouter.brandCarList()
    }

    private func showCar() {
        carsRouter.carShow()
    }

    func didSelect(brand: Brand) {
        self.selectedBrand = brand
        mainView.update(toState: .brandSelected(brand))
    }

    func didSelect(brandCar: BrandCar) {
        guard let selectedBrand = selectedBrand else {
            return mainView.update(toState: .nothingSelected)
        }
        self.selectedBrandCar = brandCar
        mainView.update(toState: .brandAndCarSelected(selectedBrand, brandCar))
    }

}
