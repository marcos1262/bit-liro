import NetworkLayer
import RxCocoa

final class ExchangeListViewModel {

    private var networkManager: AnyNetworkManager

    let sceneTitle = BehaviorRelay<String>(value: LocalizedStrings.listSceneTitle)
    let model = BehaviorRelay<[Exchange]>(value: [])
    let isLoading = BehaviorRelay<Bool>(value: true)
    let isError = BehaviorRelay<Bool>(value: false)
    let didSelectItem = PublishRelay<Exchange>()

    init(networkManager: AnyNetworkManager) {
        self.networkManager = networkManager
    }
}

// MARK: - ExchangeListViewModelProtocol

extension ExchangeListViewModel: ExchangeListViewModelProtocol {

    func loadData() {
        isLoading.accept(true)
        networkManager.request(ExchangeListService.getExchangeList) { [weak self] (result: Result<[Exchange], Error>) in
            self?.isLoading.accept(false)
            switch result {
            case .success(let response):
                self?.model.accept(response)
            case .failure:
                self?.isError.accept(true)
            }
        }
    }
}
