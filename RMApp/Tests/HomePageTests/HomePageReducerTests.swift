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
            return mockCharactersFor1stPage
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
        let page = 1
        _ = await store.send(.loadData(page)) {
            $0.loading = true
        }
        await receiveAndCheckPage(page, mockCharactersFor1stPage)
    }

    func testLoadDetailsFlow() async throws {
        let page = 1
        _ = await store.send(.loadData(page)) {
            $0.loading = true
        }

        await receiveAndCheckPage(page, mockCharactersFor1stPage)

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

    func testLoadingOf1stAnd2ndPage() async throws {
        var page = 1
        _ = await store.send(.loadData(page)) {
            $0.loading = true
        }
        await receiveAndCheckPage(page, mockCharactersFor1stPage)

        page = 2
        store.dependencies.rmCharacterService.fetchCharactersForPage = { _ in
            return mockCharactersFor2ndPage
        }
        
        _ = await store.send(.loadData(page)) {
            $0.loading = true
        }

        await receiveAndCheckPage(page, mockCharactersFor2ndPage)
    }

    fileprivate func receiveAndCheckPage(_ page: Int,
                                         _ mockCharactersForPage: RMApi.CharactersPage) async {
        _ = await store.receive(.dataLoaded(.success(mockCharactersForPage))) {
            $0.itemPageDict[page] = mockCharactersForPage.characters
            $0.loading = false
            $0.currentPage = page
        }
    }

}

private var mockCharactersFor1stPage: RMApi.CharactersPage { RMGraphQL.charactersPageMock(page: 1) }
private var mockCharactersFor2ndPage: RMApi.CharactersPage { RMGraphQL.charactersPageMock(page: 2) }
