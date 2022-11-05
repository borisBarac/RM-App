import ComposableArchitecture
import Helpers
import DetailsPage
import RMGraphQL

import XCTest
@testable import HomePage

@MainActor
final class HomePageTests: XCTestCase {

    var store = TestStore(initialState: HomePageReducer.State(),
                          reducer: HomePageReducer()).scope(state: HomePageView.ViewState.init,
                                                            action: HomePageReducer.Action.init)

    override func setUp() async throws {
        try await super.setUp()
        store = TestStore(initialState: HomePageReducer.State(),
                          reducer: HomePageReducer()).scope(state: HomePageView.ViewState.init,
                                                            action: HomePageReducer.Action.init)
    }

    func testDetailPageFlow() async throws {
        let detailsId = 22
        store.dependencies.rmCharacterService.fetchCharactersForPage = { _ in
            return mockCharactersFor1stPage
        }

        store.dependencies.rmCharacterService.fetchCharactersWithIds = { _ in
            return mockCharactersWithIds
        }

        _ = await store.send(.refresh) { state in
            state.showLoadingIndicator = true
        }

        await reveiveAndCheck1stPage()

        _ = await store.send(.detailsClick(detailsId)) { state in
            state.detailsPresentedId = detailsId
        }

        await store.receive(.detail(.loadWithId(detailsId)))

        await store.receive(.detail(.dataLoaded(.success(mockCharactersWithIds))))

        _ = await store.send(.detailsClick(nil)) { state in
            state.detailsPresentedId = nil
        }
    }

    func testLoadingPages() async throws {
        var page = 1
        store.dependencies.rmCharacterService.fetchCharactersForPage = { _ in
            return mockCharactersFor1stPage
        }

        _ = await store.send(.refresh) { state in
            state.showLoadingIndicator = true
        }

        await reveiveAndCheck1stPage()

        page = 2
        store.dependencies.rmCharacterService.fetchCharactersForPage = { _ in
            return mockCharactersFor2ndPage
        }

        _ = await store.send(.loadNextPage(page)) { state in
            state.showLoadingIndicator = true
        }

        _ = await store.receive(.dataLoaded(.success(mockCharactersFor2ndPage))) { state in
            let characters = mockCharactersFor1stPage.characters + mockCharactersFor2ndPage.characters
            state.items = characters.map {
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

extension HomePageTests {
    fileprivate func reveiveAndCheck1stPage() async {
        _ = await store.receive(.dataLoaded(.success(mockCharactersFor1stPage))) { state in
            state.items = mockCharactersFor1stPage.characters.map {
                HomePageView.CellModel(id: Int($0.id!) ?? 0,
                                       name: $0.name ?? "",
                                       url: "",
                                       origin: $0.origin?.name ?? "We do not know")
            }
            state.showLoadingIndicator = false
            state.currentPage = 1
        }
    }

}

private var mockCharactersFor1stPage: RMApi.CharactersPage { RMGraphQL.charactersPageMock() }
private var mockCharactersFor2ndPage: RMApi.CharactersPage { RMGraphQL.charactersPageMock(page: 2) }
private var mockCharactersWithIds: [RMApi.CharactersWithIdsObject] { RMGraphQL.charactersWithIdsMock() }
