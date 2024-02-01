import Quick
import Nimble
import Nimble_Snapshots
import RxSwift
import RxCocoa

@testable import BitLiro

final class ExchangeListViewTests: QuickSpec {

    override class func spec() {

        var sut: ExchangeListView!

        let disposeBag = DisposeBag()

        beforeEach {
            sut = ExchangeListView()
            sut.frame.size = .iPhoneSE
        }

        describe("#init") {
            context("when state is ready") {
                beforeEach {
                    sut.isLoading.onNext(false)
                    let items = BehaviorRelay(value: Array(repeating: Exchange(name: "Exchange Name",
                                                                               exchangeId: "ID123",
                                                                               dailyVolumeUsd: 123456789.00),
                                                           count: 5))
                    items.bind(to: sut.tableView.rx.items(cellIdentifier: ExchangeListViewCell.reuseIdentifier)) { _, model, cell in
                        guard let cell = cell as? ExchangeListViewCellProtocol else { return }
                        cell.show(model)
                    }
                    .disposed(by: disposeBag)
                }
                it("has valid snapshot") {
                    expect(sut) == snapshot()
                }
            }

            context("when state is loading") {
                beforeEach {
                    sut.isLoading.onNext(true)
                }
                it("has valid snapshot") {
                    expect(sut) == snapshot()
                }
            }

            context("when state is error") {
                beforeEach {
                    sut.isError.onNext(true)
                }
                it("has valid snapshot") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
