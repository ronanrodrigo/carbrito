import UIKit

final class CreateCarController: UIViewController {

    private var mainView: CarFormView!
    private(set) var selectedBrand: Brand?
    private(set) var selectedBrandCar: BrandCar?
    var carsRouter: CarsRouter!

    init() {
        super.init(nibName: nil, bundle: nil)
        title = String.Carbrito.title
        mainView = CarFormView(parentView: view, actions: [.selectBrand: selectBrand, .selectCar: selectCar,
                                                           .showCar: showCar])
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
        mainView.update(state: .brandSelected(brand))
    }

    func didSelect(brandCar: BrandCar) {
        guard let selectedBrand = selectedBrand else {
            return mainView.update(state: .nothingSelected)
        }
        self.selectedBrandCar = brandCar
        mainView.update(state: CarFormView.FormState.brandAndCarSelected(selectedBrand, brandCar))
    }

}
