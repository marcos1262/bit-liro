import RxCocoa

@testable import BitLiro

final class ExchangeDetailViewModelSpy: ExchangeDetailViewModelProtocol {

    var sceneTitle: BehaviorRelay<String> = BehaviorRelay(value: "sceneTitleTest")

    var nameTitleLabel: BehaviorRelay<String> = BehaviorRelay(value: "nameTitleTest")
    var nameValueLabel: BehaviorRelay<String> = BehaviorRelay(value: "nameValueTest")
    var idTitleLabel: BehaviorRelay<String> = BehaviorRelay(value: "idTitleTest")
    var idValueLabel: BehaviorRelay<String> = BehaviorRelay(value: "idValueTest")
    var volumeTitleLabel: BehaviorRelay<String> = BehaviorRelay(value: "volumeTitleTest")
    var volumeValueLabel: BehaviorRelay<String> = BehaviorRelay(value: "volumeValueTest")
}
