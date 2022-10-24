import Foundation
import RMGraphQL
import ComposableArchitecture
import Helpers
import XCTestDynamicOverlay

public class RMCharacterService {
    public var fetchCharactersForPage: @Sendable (Int) async throws -> RMApi.CharactersPage

    public required init(fetchCharactersForPage: @escaping @Sendable (Int) async throws -> RMApi.CharactersPage) {
        self.fetchCharactersForPage = fetchCharactersForPage
    }
}


extension RMCharacterService: DependencyKey {
    static let rmApi = try? RMApi(config: RMApiConfig(endpont: rmApiEndpont,
                                                      loggingLevel: .error,
                                                      cashingStrategy: .sql))

    public static let liveValue = RMCharacterService(fetchCharactersForPage: { page in
        guard let rmApi = rmApi else {
            throw AppError.couldNotInitGraphQlClient
        }

        return try await rmApi.getCharacters(page: page)
    })
}


extension RMCharacterService: TestDependencyKey {
    public static let testValue = RMCharacterService(fetchCharactersForPage: XCTUnimplemented("RMCharacterService.fetchCharactersForPage"))
}

extension DependencyValues {
  public var authenticationClient: RMCharacterService {
    get { self[RMCharacterService.self] }
    set { self[RMCharacterService.self] = newValue }
  }
}
