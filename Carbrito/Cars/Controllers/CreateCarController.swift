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
        print("showCar")
    }

    func didSelect(brand: Brand) {
        self.selectedBrand = brand
        mainView.didChoose(brand: brand)
    }

    func didSelect(brandCar: BrandCar) {
        self.selectedBrandCar = brandCar
        mainView.didChoose(brandCar: brandCar)
    }

}
