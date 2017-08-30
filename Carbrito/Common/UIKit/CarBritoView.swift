import UIKit

protocol CarbritoView: class {
    var emptyView: EmptyView! { get set }
    func presentError(error: CarbritoError)
    func presentEmpty()
    func setupView(parentView: UIView)
}

extension CarbritoView where Self: UIView {

    func presentError(error: CarbritoError) {
        emptyView.update(messageText: error.localizedDescription)
        DispatchQueue.main.async {
            self.emptyView.isHidden = false
        }
    }

    func presentEmpty() {
        emptyView.update(messageText: String.ShowCarView.empty)
        DispatchQueue.main.async {
            self.emptyView.isHidden = false
        }
    }

    func setupView(parentView: UIView) {
        backgroundColor = .white
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        let safeArea = parentView.safeAreaLayoutGuide
        topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        emptyView = EmptyView(parentView: parentView)
    }

}
