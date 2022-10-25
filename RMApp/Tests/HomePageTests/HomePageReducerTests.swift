import ComposableArchitecture
import Helpers
import DetailsPage
import RMGraphQL

import XCTest
@testable import HomePage

@MainActor
final class HomePageReducerTests: XCTestCase {
    var store = TestStore(initialState: HomePageReducer.State(),
                                 reducer: HomePageReducer())

    override func setUp() async throws {
        try await super.setUp()
        store = TestStore(initialState: HomePageReducer.State(),
                          reducer: HomePageReducer())

        store.dependencies.rmCharacterService.fetchCharactersForPage = { _ in
            return mockCharactersPage
        }
    }

    func testSendError() async throws {
        let error = AppError.unknown.toEquatableError()
        _ = await store.send(.showError(error)) { state in
            state.error = error
            state.loading = false
        }
    }

    func testLoadDataFlow() async throws {
        _ = await store.send(.loadData) { state in
            state.loading = true
        }
        _ = await store.receive(.dataLoaded(.success(mockCharactersPage))) { state in
            state.items = mockCharactersPage.characters
            state.loading = false
        }
    }

    func testLoadDetailsFlow() async throws {
        _ = await store.send(.loadData) { state in
            state.loading = true
        }
        _ = await store.receive(.dataLoaded(.success(mockCharactersPage))) { state in
            state.items = mockCharactersPage.characters
            state.loading = false
        }
        _ = await store.send(.setDetailsPresented(true)) { state in
            state.detailsPresented = true
            state.detailState = DetailsPageReducer.State()
        }
        _ = await store.send(.detail(.doSomething(mockCharactersPage.characters.first!.name ?? ""))) { state in
            state.detailState?.details = mockCharactersPage.characters.first!.name
        }
        _ = await store.send(.setDetailsPresented(false)) { state in
            state.detailsPresented = false
            state.detailState = nil
        }
    }

}

private var mockCharactersPage: RMApi.CharactersPage { RMGraphQL.charactersPageMock() }
