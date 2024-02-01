import UIKit

final class ExchangeListViewCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 16)
        view.textColor = .label
        return view
    }()

    private let idLabel : UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16)
        view.textColor = .secondaryLabel
        return view
    }()

    private let volumeLabel : UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .semibold)
        view.textColor = .systemGreen
        view.textAlignment = .right
        return view
    }()

    private let labelStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = Spacing.small
        view.distribution = .equalSpacing
        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Spacing.small
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .secondarySystemBackground
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        buildViewHierarchy()
        addConstraints()
    }

    private func buildViewHierarchy() {
        [idLabel, volumeLabel].forEach(labelStackView.addArrangedSubview)
        [nameLabel, labelStackView].forEach(stackView.addArrangedSubview)
        contentView.addSubview(stackView)
    }

    private func addConstraints() {
        stackView.fillToSuperview(padding: Spacing.medium)
    }
}

// MARK: - ExchangeListViewCellProtocol

extension ExchangeListViewCell: ExchangeListViewCellProtocol {

    func show(_ model: Exchange)  {
        nameLabel.text = model.name ?? "Unknown name"
        idLabel.text = model.exchangeId
        volumeLabel.text = String(model.dailyVolumeUsd)
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI

struct ExchangeListViewCell_Preview: PreviewProvider {
    static var previews: some View {
        let view = ExchangeListViewCell()
        view.show(Exchange(name: "Exchange Name",
                           exchangeId: "ID123",
                           dailyVolumeUsd: 123.45))
        return view
            .asPreview()
            .previewLayout(.sizeThatFits)
            .frame(width: 300, height: 76, alignment: .center)
    }
}
#endif
