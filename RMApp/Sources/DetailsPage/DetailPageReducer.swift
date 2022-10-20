import ComposableArchitecture
import SwiftUI
import Dispatch
import Helpers

public struct DetailsPageReducer: ReducerProtocol, Sendable {
    public struct State: Equatable {
        public var details: String?
        public init() {
        }
    }

    public enum Action: Equatable {
        case doSomething(String)
    }

    public init() {}

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .doSomething(let detailsText):
                state.details = detailsText
                return .none
            }
        }
    }

}
