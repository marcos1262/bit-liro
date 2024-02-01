@testable import BitLiro

extension Exchange {

    static func stub(name: String? = "exchangeNameTest",
                     exchangeId: String = "exchangeIdTest",
                     dailyVolumeUsd: Double = 123.45) -> Exchange {
        Exchange(name: name, exchangeId: exchangeId, dailyVolumeUsd: dailyVolumeUsd)
    }
}
