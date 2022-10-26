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

        var page = 1
        store.dependencies.rmCharacterService.fetchCharactersForPage = { _ in
            return mockCharactersFor1stPage
        }

        _ = await store.send(.refresh) { state in
            state.showLoadingIndicator = true
        }
        await receiveAndCheckPage(store, page, mockCharactersFor1stPage)

        _ = await store.send(.detailsClick(true)) { state in
            state.detailsPresented = true
        }
        _ = await store.send(.detailsClick(false)) { state in
            state.detailsPresented = false
        }

        page = 2
        store.dependencies.rmCharacterService.fetchCharactersForPage = { _ in
            return mockCharactersFor2ndPage
        }

        _ = await store.send(.loadNextPage(page)) { state in
            state.showLoadingIndicator = true
        }
        await receiveAndCheckPage(store, page, mockCharactersFor2ndPage)
    }

    fileprivate func receiveAndCheckPage(_ store: TestStore<HomePageReducer.State, HomePageReducer.Action, HomePageView.ViewState, HomePageView.ViewAction, ()>,
                                         _ page: Int,
                                         _ mockCharactersForPage: RMApi.CharactersPage) async {
        _ = await store.receive(.dataLoaded(.success(mockCharactersForPage))) { state in
            state.items = mockCharactersForPage.characters.map {
                HomePageView.CellModel(id: Int($0.id!) ?? 0,
                          name: $0.name ?? "",
                          url: "",
                          origin: $0.origin?.name ?? "We do not know")
            }
            state.showLoadingIndicator = false
            state.currentPage = page
        }
    }
}

private var mockCharactersFor1stPage: RMApi.CharactersPage { RMGraphQL.charactersPageMock() }
private var mockCharactersFor2ndPage: RMApi.CharactersPage { RMGraphQL.charactersPageMock(page: 2) }
