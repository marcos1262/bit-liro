import UIKit

final class ErrorView: UIView, ErrorViewProtocol {

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: UIFont.labelFontSize)
        view.textColor = .secondaryLabel
        view.numberOfLines = 0
        view.text = LocalizedStrings.errorMessage
        view.textAlignment = .center
        return view
    }()

    let retryButton: UIButton = {
        let view = UIButton(type: .custom)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.cornerRadius = 16
        view.setTitle(LocalizedStrings.tryAgain, for: .normal)
        view.setTitleColor(.label, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 16)
        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Spacing.large
        view.alignment = .center
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .systemBackground
        buildViewHierarchy()
        addConstraints()
    }

    private func buildViewHierarchy() {
        [titleLabel, retryButton].forEach(stackView.addArrangedSubview)
        addSubview(stackView)
    }

    private func addConstraints() {
        retryButton
            .anchor(widthConstant: 150)
            .anchor(heightConstant: 32)

        stackView
            .anchor(centerX: centerXAnchor)
            .anchor(centerY: centerYAnchor)
            .anchor(width: widthAnchor, padding: Spacing.xLarge)
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI

struct ErrorView_Preview: PreviewProvider {
    static var previews: some View {
        ErrorView()
            .asPreview()
            .previewLayout(.sizeThatFits)
    }
}
#endif
