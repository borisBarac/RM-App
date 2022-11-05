import ComposableArchitecture
import SwiftUI
import RMGraphQL

import SnapshotTesting
import XCTest
@testable import HomePage

/*
 Notes:
 I am not sure how i feel about this, on one hand it is a controlled UI Test,
 on the other hand it comes wilt some stupid problems.
 Like for example here we are testing agains a snapshot that is working, and network is mocked, but the images are still loading, so the UI is a bit diffrent.
 And to work around this we need to implement image mocking also, or we need to have custom actions in the app reducer that are gonna be used just for this case.

 But i love the framework for SnapTesting, and i can see it having the most power testing small views, and data structures (it can also do that).

 U gonna be able to see example of this in HelpersTests
 */

#if os(iOS)
@MainActor
final class HomePageSnapshotTests: XCTestCase {

    func testSnapshots() async throws {

        let page = 1
        let store = TestStore(initialState: HomePageReducer.State(),
                              reducer: HomePageReducer())

        store.dependencies.rmCharacterService.fetchCharactersForPage = { _ in
            return mockCharactersFor1stPage
        }

        _ = await store.send(.loadData(page),
                             view: HomePageView.init(store: ),
                             as: .image(layout: .device(config: .iPhone13))) {
            $0.loading = true
        }

        _ = await store.receive(.dataLoaded(.success(mockCharactersFor1stPage)),
                                view: HomePageView.init(store: ),
                                as: .image(layout: .device(config: .iPhone13))) {
            $0.itemPageDict[page] = mockCharactersFor1stPage.characters
            $0.loading = false
            $0.currentPage = page
        }
    }
}
#endif

extension TestStore where Action: Equatable, ScopedState: Equatable {

    func receive<V: View, Format>(
        _ action: Action,
        view: @escaping (Store<ScopedState, ScopedAction>) -> V,
        as snapshotting: Snapshotting<V, Format>,
        _ updateExpectingResult: ((inout ScopedState) throws -> Void)? = nil,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) async {
        await receive(action) { state in
            do {
                try updateExpectingResult?(&state)
            } catch {
                XCTFail("Threw error: \(error)", file: file, line: line)
            }
            let store = Store<ScopedState, ScopedAction>(initialState: state, reducer: .empty, environment: ())
            let view = view(store)
            assertSnapshot(matching: view, as: snapshotting, file: file, testName: testName, line: line)
        }
    }

    @discardableResult
    func send<V: View, Format>(
        _ action: ScopedAction,
        view: @escaping (Store<ScopedState, ScopedAction>) -> V,
        as snapshotting: Snapshotting<V, Format>,
        _ updateExpectingResult: ((inout ScopedState) throws -> Void)? = nil,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) async -> TestStoreTask {
        await send(action) { state in
            do {
                try updateExpectingResult?(&state)
            } catch {
                XCTFail("Threw error: \(error)", file: file, line: line)
            }
            let store = Store<ScopedState, ScopedAction>(initialState: state, reducer: .empty, environment: ())
            let view = view(store)
            assertSnapshot(matching: view, as: snapshotting, file: file, testName: testName, line: line)
        }
    }
}

private var mockCharactersFor1stPage: RMApi.CharactersPage { RMGraphQL.charactersPageMock() }

