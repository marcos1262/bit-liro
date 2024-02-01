import UIKit
import RxSwift

final class ExchangeListViewController: UIViewController {

    private let viewModel: ExchangeListViewModelProtocol
    private let contentView: ExchangeListViewProtocol

    private let disposeBag = DisposeBag()

    init(viewModel: ExchangeListViewModelProtocol,
         contentView: ExchangeListViewProtocol = ExchangeListView()) {
        self.viewModel = viewModel
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindLayoutEvents()
        viewModel.loadData()
    }

    private func bindLayoutEvents() {
        // MARK: Input

        contentView.tableView.rx.modelSelected(Exchange.self)
            .bind(to: viewModel.didSelectItem)
            .disposed(by: disposeBag)

        contentView.tableView.refreshControl?.rx.controlEvent(.valueChanged)
            .subscribe(onNext: { [weak self] in
                self?.viewModel.loadData()
            })
            .disposed(by: disposeBag)

        contentView.errorView.retryButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.viewModel.loadData()
            })
            .disposed(by: disposeBag)

        // MARK: Output

        viewModel.sceneTitle
            .bind(to: rx.title)
            .disposed(by: disposeBag)

        viewModel.isLoading
            .bind(to: contentView.isLoading)
            .disposed(by: disposeBag)

        viewModel.isError
            .bind(to: contentView.isError)
            .disposed(by: disposeBag)

        viewModel.model
            .bind(to: contentView.tableView.rx.items(cellIdentifier: ExchangeListViewCell.reuseIdentifier)) { _, model, cell in
                guard let cell = cell as? ExchangeListViewCellProtocol else { return }
                cell.show(model)
            }
            .disposed(by: disposeBag)
    }
}
