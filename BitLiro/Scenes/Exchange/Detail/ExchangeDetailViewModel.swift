import RxCocoa

struct ExchangeDetailViewModel: ExchangeDetailViewModelProtocol {

    let sceneTitle: BehaviorRelay<String>
    let nameTitleLabel: BehaviorRelay<String>
    let nameValueLabel: BehaviorRelay<String>
    let idTitleLabel: BehaviorRelay<String>
    let idValueLabel: BehaviorRelay<String>
    let volumeTitleLabel: BehaviorRelay<String>
    let volumeValueLabel: BehaviorRelay<String>

    init(from model: Exchange) {
        sceneTitle = BehaviorRelay(value: LocalizedStrings.detailSceneTitle)
        nameTitleLabel = BehaviorRelay(value: LocalizedStrings.nameTitle)
        nameValueLabel = BehaviorRelay(value: model.name ?? "Unknown name")
        idTitleLabel = BehaviorRelay(value: LocalizedStrings.idTitle)
        idValueLabel = BehaviorRelay(value: model.exchangeId)
        volumeTitleLabel = BehaviorRelay(value: LocalizedStrings.volumeTitle)

        let formattedVolume = String(model.dailyVolumeUsd)
        volumeValueLabel = BehaviorRelay(value: formattedVolume)
    }
}
