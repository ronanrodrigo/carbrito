import UIKit

class ShowCarView: UIView {

    private let carNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(parentView: UIView) {
        super.init(frame: .zero)
        setupView(parentView: parentView)
        setupCarNameLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: ShowCarView.self))
    }

    private func setupView(parentView: UIView) {
        backgroundColor = .background
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        let safeArea = parentView.safeAreaLayoutGuide
        topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
    }

    private func setupCarNameLabel() {
        addSubview(carNameLabel)
        carNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        carNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        carNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        carNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }

}

extension ShowCarView: DetailCarPresenter {
    func present(cars: [Car]) {
        guard let car = cars.first else {
            return presentEmpty()
        }
        carNameLabel.text = car.name
    }

    func present(error: CarError) { }

    func presentEmpty() { }

}
