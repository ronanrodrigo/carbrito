import UIKit

struct ShowCarViewValueLabelFactory {

    static func make() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .primary
        label.textAlignment = .left
        label.text = " "
        label.alpha = 0
        return label
    }

}
