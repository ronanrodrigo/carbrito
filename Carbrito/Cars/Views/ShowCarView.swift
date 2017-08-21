import UIKit

class ShowCarView: UIView {

    init(parentView: UIView) {
        super.init(frame: .zero)
        setupView(parentView: parentView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: ShowCarView.self))
    }

    private func setupView(parentView: UIView) {
        backgroundColor = .white
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        let safeArea = parentView.safeAreaLayoutGuide
        topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
    }

}
