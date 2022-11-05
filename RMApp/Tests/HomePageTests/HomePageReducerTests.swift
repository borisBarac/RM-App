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

        store.dependencies.rmCharacterService.fetchCharactersWithIds = { _ in
            return mockCharactersWithIds
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
        let detailId = 22
        let page = 1
        _ = await store.send(.loadData(page)) {
            $0.loading = true
        }

        await receiveAndCheckPage(page, mockCharactersFor1stPage)

        _ = await store.send(.setDetailsPresented(detailId)) {
            $0.detailsPresented = true
            $0.detailState = DetailsPageReducer.State(id: detailId)
        }

        _ = await store.receive(.detail(.loadWithId(detailId))) {
            $0.detailState?.id = detailId
            $0.detailState?.isLoading = true
            $0.detailState?.detailItem = nil
            $0.detailState?.error = nil
        }

        _ = await store.receive(.detail(.dataLoaded(.success(mockCharactersWithIds)))) {
            $0.detailState?.isLoading = false
            $0.detailState?.error = nil
            $0.detailState?.detailItem = mockCharactersWithIds.first
        }

        _ = await store.send(.setDetailsPresented(nil)) {
            $0.detailsPresented = false
            $0.detailState = nil
            $0.detailState?.isLoading = false
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

    func testRefresh() async throws {
        var page = 1
        _ = await store.send(.loadData(page)) {
            $0.loading = true
        }
        await receiveAndCheckPage(page, mockCharactersFor1stPage)

        _ = await store.send(.loadData(0)) {
            $0.loading = true
            $0.currentPage = 0
            $0.itemPageDict = [Int: [HomePageReducer.ItemsType]]()
        }
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
private var mockCharactersWithIds: [RMApi.CharactersWithIdsObject] { RMGraphQL.charactersWithIdsMock() }
