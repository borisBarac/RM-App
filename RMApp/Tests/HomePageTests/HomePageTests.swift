import ComposableArchitecture
import Helpers
import DetailsPage
import XCTest
@testable import HomePage

@MainActor
final class HomePageTests: XCTestCase {
    func testMainFlow() async throws {
        var store = TestStore(initialState: HomePageReducer.State(),
                              reducer: HomePageReducer()
        ).scope(state: HomePageView.ViewState.init , action: HomePageReducer.Action.init)


        _ = await store.send(.refresh) { state in
            state.showLoadingIndicator = true
        }
        _ = await store.receive(.dataLoaded(mockArrayGlobal)) { state in
            state.items = mockArrayGlobal
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

private let mockArrayGlobal = ["f1", "f2", "f3"]
