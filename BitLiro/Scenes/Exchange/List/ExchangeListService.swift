import Foundation
import NetworkLayer

enum ExchangeListService: Equatable {
    case getExchangeList
}

extension ExchangeListService: NetworkService {
    var baseURL: URL { URL(string: "https://rest.coinapi.io/v1")! }

    var path: String {
        switch self {
        case .getExchangeList: return "/exchanges"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getExchangeList: return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .getExchangeList: return .requestPlain
        }
    }

    var headers: Headers? { ["X-CoinAPI-Key": "B2B0CB4B-93AA-4C1D-868D-4B4B19533CFA"] }
}
