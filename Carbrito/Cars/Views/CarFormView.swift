import UIKit

final class CarFormView: UIView {

    enum ActionName: String {
        case selectBrand, selectCar, showCar
    }

    enum FormState {
        case nothingSelected, brandSelected(Brand), brandAndCarSelected(Brand, BrandCar)
    }

    private let actions: [ActionName: (() -> Void)]

    private let formItemsStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 0.5
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let chooseBrandButton: UIButton = {
        let button = FormButtonFactory.make(title: String.CarForm.chooseBrand)
        button.addTarget(self, action: .didTouchAtChooseBrandButton, for: .touchUpInside)
        return button
    }()

    private let chooseCarButton: UIButton = {
        let button = FormButtonFactory.make(title: String.CarForm.chooseCar)
        button.addTarget(self, action: .didTouchAtChooseCarButton, for: .touchUpInside)
        button.isEnabled = false
        return button
    }()

    private let showCarButton: UIButton = {
        let button = FormButtonFactory.make(title: String.CarForm.showCar)
        button.addTarget(self, action: .didTouchAtShowCarButton, for: .touchUpInside)
        button.isEnabled = false
        return button
    }()

    init(parentView: UIView, actions: [ActionName: (() -> Void)]) {
        self.actions = actions
        super.init(frame: .zero)
        setupView(parentView: parentView)
        setupFormItemsStackView()
        setupChooseBrandButton()
        setupChooseCarButton()
        setupShowCarButton()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: CarFormView.self))
    }

    private func setupView(parentView: UIView) {
        backgroundColor = .divider
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        let safeArea = parentView.safeAreaLayoutGuide
        topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
    }

    private func setupFormItemsStackView() {
        addSubview(formItemsStackView)
        formItemsStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        formItemsStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        formItemsStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        formItemsStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }

    private func setupChooseBrandButton() {
        formItemsStackView.addArrangedSubview(chooseBrandButton)
    }

    private func setupChooseCarButton() {
        formItemsStackView.addArrangedSubview(chooseCarButton)
    }

    private func setupShowCarButton() {
        formItemsStackView.addArrangedSubview(showCarButton)
    }

    private func execute(action: ActionName) {
        guard let actionCallback = actions[action] else { return Log.notLinked(action: action.rawValue) }
        actionCallback()
    }

    @objc fileprivate func didTouchAtChooseBrandButton() {
        execute(action: .selectBrand)
    }

    @objc fileprivate func didTouchAtChooseCarButton() {
        execute(action: .selectCar)
    }

    @objc fileprivate func didTouchAtShowCarButton() {
        execute(action: .showCar)
    }

    func update(toState state: FormState) {
        switch state {
        case .nothingSelected: nothingSelectedState()
        case .brandSelected(let brand): brandSelectedState(brand: brand)
        case .brandAndCarSelected(let brand, let brandCar): brandAndCarState(brand: brand, brandCar: brandCar)
        }
    }

    private func nothingSelectedState() {
        chooseBrandButton.setTitle(String.CarForm.chooseBrand.uppercased(), for: .normal)
        chooseCarButton.isEnabled = false
        chooseCarButton.setTitle(String.CarForm.chooseCar.uppercased(), for: .normal)
    }

    private func brandSelectedState(brand: Brand) {
        chooseBrandButton.setTitle(brand.name.uppercased(), for: .normal)
        chooseCarButton.setTitle(String.CarForm.chooseCar.uppercased(), for: .normal)
        chooseCarButton.isEnabled = true
        showCarButton.isEnabled = false
    }

    private func brandAndCarState(brand: Brand, brandCar: BrandCar) {
        chooseBrandButton.setTitle(brand.name.uppercased(), for: .normal)
        chooseCarButton.setTitle(brandCar.name.uppercased(), for: .normal)
        showCarButton.isEnabled = true
    }

}

fileprivate extension Selector {
    static let didTouchAtChooseBrandButton = #selector(CarFormView.didTouchAtChooseBrandButton)
    static let didTouchAtChooseCarButton = #selector(CarFormView.didTouchAtChooseCarButton)
    static let didTouchAtShowCarButton = #selector(CarFormView.didTouchAtShowCarButton)
}
