import Foundation
import RMGraphQL
import ComposableArchitecture
import Helpers
import XCTestDynamicOverlay

// MARK: Interface Definitions
// we have typealias here to decouple the Service from RMGraphQL
// classes using this service do not have to import RMGraphQL this way
// if we would need to connect to diffrent services from here (GraphQL and Rest dependinc on the country for example)
// we would need to define types that we gonna use here and map to them from the network types
// good thing about graphQl is that we define the BE model of the data
public typealias GQLChactersPage = RMApi.CharactersPage
public typealias GQLCharactersWithIdsObject = RMApi.CharactersWithIdsObject

public class RMCharacterService {
    public var fetchCharactersForPage: @Sendable (Int) async throws -> GQLChactersPage
    public var fetchCharactersWithIds: @Sendable ([Int]) async throws -> [GQLCharactersWithIdsObject]

    public required init(fetchCharactersForPage: @escaping @Sendable (Int) async throws -> GQLChactersPage,
                         fetchCharactersWithIds: @escaping @Sendable ([Int]) async throws -> [GQLCharactersWithIdsObject]) {
        self.fetchCharactersForPage = fetchCharactersForPage
        self.fetchCharactersWithIds = fetchCharactersWithIds
    }
}

// MARK: - Live setup
extension RMCharacterService: DependencyKey {
    private static let rmApi = try? RMApi(config: RMApiConfig(endpont: rmApiEndpont,
                                                      loggingLevel: .error,
                                                      cashingStrategy: .sql))

    public static let liveValue = RMCharacterService(
        fetchCharactersForPage: { page in
            guard let rmApi = rmApi else {
                throw AppError.couldNotInitGraphQlClient
            }

            do {
                return try await rmApi.getCharacters(page: page)
            } catch let error {
                if let throwError = error as? RMError {
                    printError(message: throwError.localizedDescription)
                    throw AppError.rmApiError(throwError)
                }

                printError(message: "RMCharacterService: general error thrown")
                throw AppError.unknown
            }
        },
        fetchCharactersWithIds: { ids in
            guard let rmApi = rmApi else {
                throw AppError.couldNotInitGraphQlClient
            }

            do {
                return try await rmApi.getCharacters(withIds: ids)
            } catch let error {
                if let throwError = error as? RMError {
                    printError(message: throwError.localizedDescription)
                    throw AppError.rmApiError(throwError)
                }

                printError(message: "RMCharacterService: general error thrown")
                throw AppError.unknown
            }

        }
    )
    // MARK: - previewValue setup
    public static var previewValue: RMCharacterService {
        RMCharacterService { _ in
            RMGraphQL.charactersPageMock()
        } fetchCharactersWithIds: { _ in
            RMGraphQL.charactersWithIdsMock()
        }
    }
}
// MARK: - UnitTest setup
extension RMCharacterService: TestDependencyKey {
    public static let testValue = RMCharacterService(fetchCharactersForPage: XCTUnimplemented("RMCharacterService.fetchCharactersForPage"),
                                                     fetchCharactersWithIds: XCTUnimplemented("RMCharacterService.fetchCharactersWithIds"))
}

// MARK: - Dependency injections setup
extension DependencyValues {
  public var rmCharacterService: RMCharacterService {
    get { self[RMCharacterService.self] }
    set { self[RMCharacterService.self] = newValue }
  }
}

extension GQLChactersPage: Equatable {
    public static func == (lhs: RMApi.CharactersPage, rhs: RMApi.CharactersPage) -> Bool {
        return (lhs.characters == rhs.characters && lhs.info == rhs.info)
    }
}


