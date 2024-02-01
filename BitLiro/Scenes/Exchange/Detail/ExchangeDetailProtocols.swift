import UIKit
import RxCocoa

protocol ExchangeDetailViewModelProtocol {
    var sceneTitle: BehaviorRelay<String> { get }

    var nameTitleLabel: BehaviorRelay<String> { get }
    var nameValueLabel: BehaviorRelay<String> { get }
    var idTitleLabel: BehaviorRelay<String> { get }
    var idValueLabel: BehaviorRelay<String> { get }
    var volumeTitleLabel: BehaviorRelay<String> { get }
    var volumeValueLabel: BehaviorRelay<String> { get }
}

protocol ExchangeDetailViewProtocol where Self: UIView {
    var nameTitleLabel: UILabel { get }
    var nameValueLabel: UILabel { get }
    var idTitleLabel: UILabel { get }
    var idValueLabel: UILabel { get }
    var volumeTitleLabel: UILabel { get }
    var volumeValueLabel: UILabel { get }
}
