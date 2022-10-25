import ComposableArchitecture
import Helpers
import DetailsPage
import RMGraphQL

import XCTest
@testable import HomePage

@MainActor
final class HomePageTests: XCTestCase {
    func testMainFlow() async throws {
        let store = TestStore(initialState: HomePageReducer.State(),
                              reducer: HomePageReducer()).scope(state: HomePageView.ViewState.init,
                                                                action: HomePageReducer.Action.init)

        store.dependencies.rmCharacterService.fetchCharactersForPage = { _ in
            return mockCharactersPage
        }

        _ = await store.send(.refresh) { state in
            state.showLoadingIndicator = true
        }
        _ = await store.receive(.dataLoaded(.success(mockCharactersPage))) { state in
            state.items = mockCharactersPage.characters.map { $0.name ?? "" }
            state.showLoadingIndicator = false
        }
        _ = await store.send(.detailsClick(true)) { state in
            state.detailsPresented = true
        }
        _ = await store.send(.detailsClick(false)) { state in
            state.detailsPresented = false
        }

    }
    
}

private var mockCharactersPage: RMApi.CharactersPage { RMGraphQL.charactersPageMock() }
