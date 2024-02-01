import RxSwift
import RxCocoa

@testable import BitLiro

final class ExchangeListViewModelSpy: ExchangeListViewModelProtocol {

    var sceneTitle: BehaviorRelay<String> = BehaviorRelay(value: "sceneTitleTest")
    var model: BehaviorRelay<[Exchange]> = BehaviorRelay(value: [.stub()])
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var isError: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var didSelectItem: PublishRelay<Exchange> = PublishRelay()

    private(set) var loadDataCallCount = 0

    func loadData() {
        loadDataCallCount += 1
    }
}
