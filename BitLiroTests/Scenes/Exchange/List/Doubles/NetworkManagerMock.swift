import NetworkLayer
import Foundation

@testable import BitLiro

final class NetworkManagerMock: AnyNetworkManager {

    private(set) var requestParameters = [NetworkService]()
    private(set) var cancelCallCount = 0

    var stubResult: Result<Decodable, Error> = .failure(NSError())

    func request<ServiceType: NetworkService, ResponseType: Decodable>(
        _ endpoint: ServiceType,
        _ completion: @escaping (Result<ResponseType, Error>) -> Void) {
            requestParameters.append(endpoint)

            switch stubResult {
            case .success(let stubResponse):
                guard let response = stubResponse as? ResponseType else { return }
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }

    func cancel() {
        cancelCallCount += 1
    }
}
