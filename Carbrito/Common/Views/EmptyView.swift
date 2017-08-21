import UIKit

final class EmptyView: UIView {

    private let message: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .text
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()

    init(parentView: UIView) {
        super.init(frame: .zero)
        setupView(parentView: parentView)
        setupMessageLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: ShowCarView.self))
    }

    private func setupView(parentView: UIView) {
        parentView.bringSubview(toFront: self)
        isHidden = true
        backgroundColor = .background
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        let safeArea = parentView.safeAreaLayoutGuide
        topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
    }

    private func setupMessageLabel() {
        addSubview(message)
        message.topAnchor.constraint(equalTo: topAnchor).isActive = true
        message.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        message.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        message.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }

    func update(messageText: String) {
        message.text = messageText.uppercased()
    }

}
