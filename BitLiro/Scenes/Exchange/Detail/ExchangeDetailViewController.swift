import UIKit
import RxSwift

final class ExchangeDetailViewController: UIViewController {

    private let viewModel: ExchangeDetailViewModelProtocol
    private let contentView: ExchangeDetailViewProtocol

    private let disposeBag = DisposeBag()

    init(viewModel: ExchangeDetailViewModelProtocol,
         contentView: ExchangeDetailViewProtocol = ExchangeDetailView()) {
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
    }

    private func bindLayoutEvents() {
        viewModel.sceneTitle
            .bind(to: rx.title)
            .disposed(by: disposeBag)

        viewModel.nameTitleLabel
            .bind(to: contentView.nameTitleLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.nameValueLabel
            .bind(to: contentView.nameValueLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.idTitleLabel
            .bind(to: contentView.idTitleLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.idValueLabel
            .bind(to: contentView.idValueLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.volumeTitleLabel
            .bind(to: contentView.volumeTitleLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.volumeValueLabel
            .bind(to: contentView.volumeValueLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
