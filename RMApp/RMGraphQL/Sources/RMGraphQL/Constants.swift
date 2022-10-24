import Foundation

// fallback endpoint if not provided in config
let rmApiEndpont = URL(string: "https://rickandmortyapi.graphcdn.app/")!

public enum RMError: Error, LocalizedError {
    case asyncConvertionFailed
    case couldNotCreateSqlCache
    case graphQlError(String)

    public var errorDescription: String? {
        switch self {
        case .asyncConvertionFailed:
            return "GraphQL query could not be converted to ASYNC"
        case .couldNotCreateSqlCache:
            return "RM API could not create SQL cache"
        case .graphQlError(let message):
            return message
        }

    }

    public var failureReason: String? {
        switch self {
        case .asyncConvertionFailed:
            return "GraphQL query could not be converted to ASYNC"
        case .couldNotCreateSqlCache:
            return "RM API could not create SQL cache"
        case .graphQlError(let message):
            return message
        }
    }
}
