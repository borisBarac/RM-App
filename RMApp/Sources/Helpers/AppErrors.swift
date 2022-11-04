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

    public func printError(file: String = #file, line: Int = #line) {
        print("🔴 \(file): \(line): \(errorDescription ?? "")")
    }

}

extension AppError: Encodable {
    enum CodingKeys: String, CodingKey {
        case description
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.errorDescription, forKey: .description)
    }
}

public func printError(message: String, file: String = #file, line: Int = #line) {
    print("🔴 \(file): \(line): \(message)")
}
