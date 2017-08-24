import UIKit

struct ShowCarViewLabelFactory {

    static func make(text: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .text
        label.textAlignment = .left
        return label
    }

}
