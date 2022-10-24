import Foundation
import RMGraphQL

public enum AppError: Error, LocalizedError {
    case unknown
    case couldNotInitGraphQlClient
    case rmApiError(RMError)

    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "UNKNOWN :("
        case .couldNotInitGraphQlClient:
            return "could not init GraphQlClient"
        case .rmApiError(let error):
            return error.errorDescription
        }

    }

    public var failureReason: String? {
        switch self {
        case .unknown:
            return "UNKNOWN :("
        case .couldNotInitGraphQlClient:
            return "could not init GraphQlClient"
        case .rmApiError(let error):
            return error.failureReason
        }
    }

}
