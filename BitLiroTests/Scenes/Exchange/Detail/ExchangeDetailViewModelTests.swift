import Quick
import Nimble

@testable import BitLiro

final class ExchangeDetailViewModelTests: QuickSpec {

    class override func spec() {

        var sut: ExchangeDetailViewModel!

        beforeEach {
            sut = ExchangeDetailViewModel(from: .stub())
        }

        describe("#init") {
            context("when model has all informations") {
                it("sets sceneTitle with correct value") {
                    expect(sut.sceneTitle.value) == "Exchange Detail"
                }
                it("sets nameTitleLabel with correct value") {
                    expect(sut.nameTitleLabel.value) == "Name"
                }
                it("sets nameValueLabel with correct value") {
                    expect(sut.nameValueLabel.value) == Exchange.stub().name
                }
                it("sets idTitleLabel with correct value") {
                    expect(sut.idTitleLabel.value) == "Exchange ID"
                }
                it("sets idValueLabel with correct value") {
                    expect(sut.idValueLabel.value) == Exchange.stub().exchangeId
                }
                it("sets volumeTitleLabel with correct value") {
                    expect(sut.volumeTitleLabel.value) == "Daily Volume"
                }
                it("sets volumeValueLabel with correct value") {
                    expect(sut.volumeValueLabel.value) == String(Exchange.stub().dailyVolumeUsd)
                }
            }

            context("when model name is Nil") {
                beforeEach {
                    sut = ExchangeDetailViewModel(from: .stub(name: nil))
                }
                it("sets nameValueLabel with correct value") {
                    expect(sut.nameValueLabel.value) == "Unknown name"
                }
            }
        }
    }
}
