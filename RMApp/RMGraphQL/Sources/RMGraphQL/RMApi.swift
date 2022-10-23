import Foundation
import Apollo
import ApolloSQLite
import Api

public struct RMApi {
    public typealias CharacterPageObject = CharactersForPageQuery.Data.Characters.Result
    public typealias CharactersWithIdsObject = CharactersWithIdsQuery.Data.Character

    let apolloClient: ApolloClient
    let logger: Logger

    public init(config: RMApiConfig, authBlock: AuthBlockType? = nil) throws {
        self.logger = Logger(loggingLevel: config.loggingLevel)

        let store = ApolloStore(cache: try config.cashingStrategy.getCache() )

        let client = URLSessionClient(sessionConfiguration: config.sessionConfiguration)
        let provider = NetworkInterceptorProvider(store: store, client: client, logger: logger, authBlock: authBlock, mockInterceptor: config.mockInterceptor)

        let url = config.endpont ?? rmApiEndpont
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        apolloClient =  ApolloClient(networkTransport: requestChainTransport, store: store)
    }

    public func getCharacters(page: Int) async throws -> [CharacterPageObject] {
        let query = CharactersForPageQuery(page: GraphQLNullable<Int>(integerLiteral: page))
        do {
            return try await withCheckedThrowingContinuation { continuation in
                apolloClient.fetch(query: query) { result in
                    switch result {
                    case .success(let data):
                        continuation.resume(returning: (data.data?.characters?.results?.compactMap { $0 } ?? []))
                    case .failure(let error):
                        continuation.resume(throwing: check(error: error))
                    }
                }
            }

        } catch {
            throw RMError.asyncConvertionFailed
        }
    }

    public func getCharacters(withIds ids: [Int]) async throws -> [CharactersWithIdsObject] {
        let query = CharactersWithIdsQuery(ids: ids.map { String($0) })
        do {
            return try await withCheckedThrowingContinuation { continuation in
                apolloClient.fetch(query: query) { result in
                    switch result {
                    case .success(let data):
                        continuation.resume(returning: (data.data?.characters?.compactMap { $0 } ?? []))
                    case .failure(let error):
                        continuation.resume(throwing: check(error: error))
                    }
                }
            }

        } catch {
            throw RMError.asyncConvertionFailed
        }
    }

    private func check(error: Error) -> Error {
        guard let err = error as? GraphQLError else {
            return error
        }

        return RMError.graphQlError(err.localizedDescription)
    }

}

// MARK: - Private helpers

private extension CashingStrategy {
    func getCache() throws -> NormalizedCache {
        switch self {
        case .inMemory:
            return InMemoryNormalizedCache()
        case .sql:
            return try ApolloStore.createSqlCache()
        case .none:
            return NoCache()
        }
    }
}

private extension ApolloStore {
    static func createSqlCache() throws -> SQLiteNormalizedCache {
        let documentsPath = NSSearchPathForDirectoriesInDomains(
            .cachesDirectory,
            .userDomainMask,
            true
        ).first!

        let documentsURL = URL(fileURLWithPath: documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent("rm_api_apollo_db.sqlite")

        do {
            return try SQLiteNormalizedCache(fileURL: sqliteFileURL)
        } catch {
            throw RMError.couldNotCreateSqlCache
        }
    }
}
