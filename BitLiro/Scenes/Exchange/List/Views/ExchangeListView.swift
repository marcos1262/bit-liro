import UIKit

final class ExchangeListView: UIView, ExchangeListViewProtocol {

    let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.register(ExchangeListViewCell.self)
        view.backgroundColor = .clear
        view.contentInset = UIEdgeInsets(top: Spacing.large, left: 0, bottom: 0, right: 0)
        view.tableFooterView = UIView()
        view.refreshControl = UIRefreshControl()
        view.isHidden = true
        return view
    }()

    private let uiActivityIndicator = UIActivityIndicatorView(style: .large)

    let errorView: ErrorViewProtocol = {
        let view = ErrorView()
        view.isHidden = true
        return view
    }()

    var isLoading: Binder<Bool> {
        Binder(self) { view, isLoading in
            view.errorView.isHidden = true
            if isLoading {
                view.tableView.isHidden = true
                view.tableView.refreshControl?.endRefreshing()
                view.uiActivityIndicator.startAnimating()
            } else {
                view.tableView.isHidden = false
                view.uiActivityIndicator.stopAnimating()
            }
        }
    }

    var isError: Binder<Bool> {
        Binder(self) { view, isError in
            view.uiActivityIndicator.isHidden = true
            if isError {
                view.tableView.isHidden = true
                view.errorView.isHidden = false
            } else {
                view.tableView.isHidden = false
                view.errorView.isHidden = true
            }
        }
    }

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
        [tableView, uiActivityIndicator, errorView].forEach(addSubview)
    }

    private func addConstraints() {
        tableView.fillToSuperview()

        uiActivityIndicator
            .anchor(centerX: centerXAnchor)
            .anchor(centerY: centerYAnchor)

        errorView.fillToSuperview()
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
import RxSwift
import RxCocoa

struct ExchangeListView_Preview: PreviewProvider {

    static let disposeBag = DisposeBag()

    static var previews: some View {
        let view = ExchangeListView()
        view.isLoading.onNext(false)
        let items = BehaviorRelay(value: Array(repeating: Exchange(name: "Exchange Name",
                                                                   exchangeId: "ID123",
                                                                   dailyVolumeUsd: 123456789.00),
                                               count: 5))
        items.bind(to: view.tableView.rx.items(cellIdentifier: ExchangeListViewCell.reuseIdentifier)) { _, model, cell in
            guard let cell = cell as? ExchangeListViewCellProtocol else { return }
            cell.show(model)
        }
        .disposed(by: disposeBag)
        return view
            .asPreview()
            .previewLayout(.sizeThatFits)
    }
}
#endif
