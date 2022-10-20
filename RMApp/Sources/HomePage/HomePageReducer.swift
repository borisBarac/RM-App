import ComposableArchitecture
import SwiftUI
import Dispatch
import Helpers
import DetailsPage

public struct HomePageReducer: ReducerProtocol, Sendable {
    public typealias ItemsType = [String]

    // used as ID to cancel some task
    public enum TearDownToken {}

    public struct State: Equatable {
        public var items: ItemsType?
        // this is gonna need to be moved to Reducer-View combo
        public var emty: String = "Nothing to show :("
        public var loading: Bool = false
        public var error: EquatableError?
        public var detailState: DetailsPageReducer.State?

        public init() {
        }
    }

    public enum Action: Equatable {
        case loadData
        case dataLoaded(ItemsType)
        // item click need to take details action
        case detail(DetailsPageReducer.Action)
        case showError(EquatableError)
    }

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadData:
                // call effect
                state.loading = true
                state.error = nil
                return .none

            case .dataLoaded(let items):
                state.items = items
                state.loading = false
                state.error = nil
                return .none

            case .showError(let eqError):
                state.error = eqError
                state.loading = false
                return .none

            case .detail(let detailAction):
                return .none
            }
        }
    }
}
