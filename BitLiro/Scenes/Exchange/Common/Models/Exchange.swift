struct Exchange: Decodable, Equatable {
    let name: String?
    let exchangeId: String
    let dailyVolumeUsd: Double

    enum CodingKeys: String, CodingKey {
        case name
        case exchangeId = "exchange_id"
        case dailyVolumeUsd = "volume_1day_usd"
    }
}
