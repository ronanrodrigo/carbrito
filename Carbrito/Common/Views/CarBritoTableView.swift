import UIKit

class CarBritoTableView: UITableView {

    var emptyView: EmptyView!

}

extension CarBritoTableView: EmptyPresenter {

    func present(error: CarbritoError) {
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

}
