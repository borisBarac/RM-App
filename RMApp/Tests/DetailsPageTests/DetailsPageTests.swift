import ComposableArchitecture
import Helpers
import RMGraphQL

import XCTest
@testable import DetailsPage

@MainActor
final class DetailPageTests: XCTestCase {
    var store = TestStore(initialState: DetailsPageReducer.State(),
                          reducer: DetailsPageReducer()).scope(state: DetailPageView.ViewState.init,
                                                               action: DetailsPageReducer.Action.init)

    func testFlow() async throws {
        store.dependencies.rmCharacterService.fetchCharactersWithIds = { _ in
            return mockCharactersWithIds
        }

        _ = await store.send(.loadDetailsWithId(2)) {
            $0.showLoadingIndicator = true
        }

        _ = await store.receive(.dataLoaded(.success(mockCharactersWithIds))) {
            $0.showLoadingIndicator = false
            $0.eqError = nil
            $0.item = DetailPageView.DetailModel(item: mockCharactersWithIds.first!)
        }
    }

}

private var mockCharactersWithIds: [RMApi.CharactersWithIdsObject] { RMGraphQL.charactersWithIdsMock() }
