import ComposableArchitecture
import SwiftUI
import Dispatch
import Helpers

public struct DetailsPageReducer: ReducerProtocol, Sendable {
    // used as ID to cancel some task
    public enum TearDownToken {}

    public struct State: Equatable {
        public var details: String?
        public init() {
        }
    }

    public enum Action: Equatable {
        case doSomething
    }

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
                .none
        }
    }
    
}
