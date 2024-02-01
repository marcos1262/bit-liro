import UIKit

final class ExchangeDetailView: UIStackView, ExchangeDetailViewProtocol {

    let nameTitleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: UIFont.labelFontSize)
        view.textColor = .secondaryLabel
        return view
    }()

    let nameValueLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: UIFont.labelFontSize)
        view.textAlignment = .right
        return view
    }()

    private let nameStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = Spacing.small
        return view
    }()

    let idTitleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: UIFont.labelFontSize)
        view.textColor = .secondaryLabel
        return view
    }()

    let idValueLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: UIFont.labelFontSize)
        view.textAlignment = .right
        return view
    }()

    private let idStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = Spacing.small
        return view
    }()

    let volumeTitleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: UIFont.labelFontSize)
        view.textColor = .secondaryLabel
        return view
    }()

    let volumeValueLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: UIFont.labelFontSize)
        view.textAlignment = .right
        return view
    }()

    private let volumeStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = Spacing.small
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupStackView()
        buildViewHierarchy()
    }

    private func setupStackView() {
        backgroundColor = .systemBackground
        axis = .vertical
        spacing = Spacing.large
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: Spacing.large,
                                     left: Spacing.large,
                                     bottom: Spacing.large,
                                     right: Spacing.large)
    }

    private func buildViewHierarchy() {
        [nameTitleLabel, nameValueLabel].forEach(nameStackView.addArrangedSubview)
        [idTitleLabel, idValueLabel].forEach(idStackView.addArrangedSubview)
        [volumeTitleLabel, volumeValueLabel].forEach(volumeStackView.addArrangedSubview)
        [nameStackView, idStackView, volumeStackView, UIView()].forEach(addArrangedSubview)
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI

struct ExchangeDetailView_Preview: PreviewProvider {
    static var previews: some View {
        let view = ExchangeDetailView()

        view.nameTitleLabel.text = LocalizedStrings.nameTitle
        view.nameValueLabel.text = "Exchange Name"
        view.idTitleLabel.text = LocalizedStrings.idTitle
        view.idValueLabel.text = "ID123"
        view.volumeTitleLabel.text = LocalizedStrings.volumeTitle
        view.volumeValueLabel.text = "123456789.45"

        return view
            .asPreview()
            .previewLayout(.sizeThatFits)
    }
}
#endif
