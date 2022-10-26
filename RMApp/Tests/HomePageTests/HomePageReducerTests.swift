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
        _ = await store.send(.showError(error)) {
            $0.error = error
            $0.loading = false
        }
    }

    func testLoadDataFlow() async throws {
        _ = await store.send(.loadData) {
            $0.loading = true
        }
        _ = await store.receive(.dataLoaded(.success(mockCharactersPage))) {
            $0.items = mockCharactersPage.characters
            $0.loading = false
        }
    }

    func testLoadDetailsFlow() async throws {
        _ = await store.send(.loadData) {
            $0.loading = true
        }
        _ = await store.receive(.dataLoaded(.success(mockCharactersPage))) {
            $0.items = mockCharactersPage.characters
            $0.loading = false
        }
        _ = await store.send(.setDetailsPresented(true)) {
            $0.detailsPresented = true
            $0.detailState = DetailsPageReducer.State()
        }
        #warning("FIX ME")
//        _ = await store.send(.detail(.doSomething(mockCharactersPage.characters.first!.name ?? ""))) {
//            $0.detailState?.details = mockCharactersPage.characters.first!.name
//        }
        _ = await store.send(.detail(.loadEmpty))

        _ = await store.send(.setDetailsPresented(false)) {
            $0.detailsPresented = false
            $0.detailState = nil
        }
    }

}

private var mockCharactersPage: RMApi.CharactersPage { RMGraphQL.charactersPageMock() }
