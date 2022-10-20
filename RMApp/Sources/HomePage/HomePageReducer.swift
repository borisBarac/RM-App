import ComposableArchitecture
import SwiftUI
import Services
import Helpers
import DetailsPage

public struct HomePageReducer: ReducerProtocol, Sendable {
    public typealias ItemsType = [String]

    public struct State: Equatable {
        public var items: ItemsType?
        // this is gonna need to be moved to Reducer-View combo
        public var emty: String = "Nothing to show :("
        public var loading: Bool = false
        public var error: EquatableError?
        public var detailState = DetailsPageReducer.State()

        public init() {
        }
    }

    public enum Action: Equatable {
        case loadData
        case dataLoaded(ItemsType)
        case detail(DetailsPageReducer.Action)
        case showError(EquatableError)
    }

    @Dependency(\.rmRepository) var rmRepository

    public var body: some ReducerProtocol<State, Action> {
        Scope(state: \.detailState, action: /Action.detail) {
            DetailsPageReducer()
        }
        Reduce { state, action in
            switch action {
            case .loadData:
                state.items = nil
                state.loading = true
                state.error = nil
                return rmRepository
                    .repositoryEffect()
                    .eraseToEffect()
                    .map(Action.dataLoaded)

            case .dataLoaded(let items):
                state.items = items
                state.loading = false
                state.error = nil
                return .none

            case .showError(let eqError):
                state.error = eqError
                state.loading = false
                return .none

            case .detail:
                return .none
            }
        }
    }
}
