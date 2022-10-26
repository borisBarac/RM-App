import ComposableArchitecture
import SwiftUI
import Services
import Helpers
import DetailsPage

// this is gonna die when we refactor to type that supports pagination
import RMGraphQL

public struct HomePageReducer: ReducerProtocol, Sendable {

    // needs a refactor to pagination model
    public typealias ItemsType = RMApi.CharacterPageObject

    public struct State: Equatable {
        public var items: [ItemsType]?
        public var loading: Bool = false
        public var error: EquatableError?

        public var detailState: DetailsPageReducer.State?
        public var detailsPresented: Bool = false

        public init() {
        }
    }

    public enum Action: Equatable {
        case loadData
        case dataLoaded(TaskResult<GQLChactersPage>)
        case detail(DetailsPageReducer.Action)
        case setDetailsPresented(Bool)
        case showError(EquatableError)
    }

    @Dependency(\.rmCharacterService) var rmCharacterService

    public init() {
    }

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadData:
                state.items = nil
                state.loading = true
                state.error = nil
                return .task(priority: .userInitiated) {
                    .dataLoaded(
                        await TaskResult {
                            try await self.rmCharacterService.fetchCharactersForPage(2)
                        }
                    )
                }

            case .dataLoaded(.success(let items)):
                state.items = items.characters
                state.loading = false
                state.error = nil
                return .none

            case .dataLoaded(.failure(let error)):
                state.loading = false
                state.error = EquatableError(error)
                return .none

            case .showError(let eqError):
                state.error = eqError
                state.loading = false
                return .none

            case .setDetailsPresented(let presented):
                state.detailsPresented = presented
                state.detailState = presented ? DetailsPageReducer.State() : nil
                return .none

            case .detail:
                return .none
            }
        }.ifLet(\.detailState, action: /Action.detail) {
            DetailsPageReducer()
        }
    }
}
