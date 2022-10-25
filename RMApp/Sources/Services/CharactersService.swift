import Foundation
import RMGraphQL
import ComposableArchitecture
import Helpers
import XCTestDynamicOverlay

public typealias GQLChactersPage = RMApi.CharactersPage

public class RMCharacterService {
    public var fetchCharactersForPage: @Sendable (Int) async throws -> GQLChactersPage

    public required init(fetchCharactersForPage: @escaping @Sendable (Int) async throws -> GQLChactersPage) {
        self.fetchCharactersForPage = fetchCharactersForPage
    }
}

extension RMCharacterService: DependencyKey {
    private static let rmApi = try? RMApi(config: RMApiConfig(endpont: rmApiEndpont,
                                                      loggingLevel: .error,
                                                      cashingStrategy: .sql))

    public static let liveValue = RMCharacterService(fetchCharactersForPage: { page in
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
    })

    public static var previewValue: RMCharacterService {
        RMCharacterService { _ in
            RMGraphQL.charactersPageMock()
        }
    }
}

extension RMCharacterService: TestDependencyKey {
    public static let testValue = RMCharacterService(fetchCharactersForPage: XCTUnimplemented("RMCharacterService.fetchCharactersForPage"))
}

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


