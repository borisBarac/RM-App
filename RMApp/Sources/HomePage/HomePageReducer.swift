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
        // for some reason on API page 0 and page 1 are the same
        public var currentPage: Int = 0

        public var itemPageDict = [Int: [ItemsType]]()
        public var loading: Bool = false
        public var error: EquatableError?

        public var detailState: DetailsPageReducer.State?
        public var detailsPresented: Bool = false

        public init() {
        }

        func getItems(page: Int) -> [ItemsType] {
            itemPageDict[page] ?? []
        }

    }

    public enum Action: Equatable {
        case loadData(Int)
        case dataLoaded(TaskResult<GQLChactersPage>)
        case detail(DetailsPageReducer.Action)
        case setDetailsPresented(Int?)
        case showError(EquatableError)
    }

    @Dependency(\.rmCharacterService) var rmCharacterService

    public init() {
    }

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadData(let page):
                state.loading = true
                state.error = nil
                // used for refresh
                if page == 0 {
                    state.itemPageDict = [Int: [ItemsType]]()
                    state.currentPage = 0
                }
                return .task(priority: .userInitiated) {
                    .dataLoaded(
                        await TaskResult {
                            return try await self.rmCharacterService.fetchCharactersForPage(page)
                        }
                    )
                }

            case .dataLoaded(.success(let result)):
                // this complication is here because API threats 0th and 1st page the same
                let nextPage = result.info?.next
                // if no next pare we use number of pages
                let currentPage = nextPage != nil ? nextPage! - 1 : result.info?.pages ?? 0
                state.itemPageDict[currentPage] = result.characters
                state.currentPage = currentPage

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

            case .setDetailsPresented(let presentedId):
                let presented = presentedId != nil
                state.detailsPresented = presented
                state.detailState = presented ? DetailsPageReducer.State(id: presentedId) : nil
                return .none

            case .detail:
                return .none
            }
        }.ifLet(\.detailState, action: /Action.detail) {
            DetailsPageReducer()
        }
    }
}
