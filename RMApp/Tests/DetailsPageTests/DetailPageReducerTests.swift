import ComposableArchitecture
import Helpers
import RMGraphQL

import XCTest
@testable import DetailsPage

@MainActor
final class DetailPageReducerTests: XCTestCase {
    var store = TestStore(initialState: DetailsPageReducer.State(),
                          reducer: DetailsPageReducer())

    override func setUp() async throws {
        try await super.setUp()
        store = TestStore(initialState: DetailsPageReducer.State(),
                          reducer: DetailsPageReducer())

        store.dependencies.rmCharacterService.fetchCharactersWithIds = { _ in
            return mockCharactersWithIds
        }
    }

    func testFlow() async throws {
        _ = await store.send(.loadWithId(2)) {
            $0.isLoading = true
            $0.id = 2
        }

        _ = await store.receive(.dataLoaded(.success(mockCharactersWithIds))) {
            $0.isLoading = false
            $0.error = nil
            $0.detailItem = mockCharactersWithIds.first
        }
    }

}

private var mockCharactersWithIds: [RMApi.CharactersWithIdsObject] { RMGraphQL.charactersWithIdsMock() }
