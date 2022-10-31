import SwiftUI
import ComposableArchitecture
import Helpers
import Services


public struct DetailsPageReducer: ReducerProtocol, Sendable {
    public struct State: Equatable {
        public var id: Int?
        public var detailItem: GQLCharactersWithIdsObject?
        public var error: EquatableError?
        public var isLoading: Bool

        public init(id: Int? = nil,
                    detailItem: GQLCharactersWithIdsObject? = nil,
                    error: EquatableError? = nil,
                    isLoading: Bool = false) {
            self.id = id
            self.detailItem = detailItem
            self.error = error
            self.isLoading = isLoading
        }

    }

    public enum Action: Equatable {
        case loadEmpty
        case loadWithId(Int)
        case dataLoaded(TaskResult<[GQLCharactersWithIdsObject]>)
        case showError(EquatableError)
    }

    @Dependency(\.rmCharacterService) var rmCharacterService

    public init() {
    }

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadEmpty:
                return .none

            case .loadWithId(let id):
                state.id = id
                state.isLoading = true
                state.detailItem = nil
                state.error = nil
                return .task(priority: .userInitiated) {
                    .dataLoaded(
                        await TaskResult {
                            try await self.rmCharacterService.fetchCharactersWithIds([id])
                        }
                    )
                }

            case .dataLoaded(.success(let items)):
                state.detailItem = items.first
                state.isLoading = false
                state.error = nil
                return .none

            case .dataLoaded(.failure(let error)):
                state.isLoading = false
                state.error = EquatableError(error)
                return .none

            case .showError(let error):
                state.isLoading = false
                state.error = EquatableError(error)
                return .none
            }
        }
    }

}
