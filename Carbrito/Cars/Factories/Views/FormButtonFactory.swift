import UIKit

struct FormButtonFactory {

    static func make(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title.uppercased(), for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.primary, for: .normal)
        button.setTitleColor(.disabled, for: .disabled)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return button
    }

}
