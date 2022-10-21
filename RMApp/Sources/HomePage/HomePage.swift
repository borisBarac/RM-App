import SwiftUI
import ComposableArchitecture

@MainActor
public struct HomePageView: View {
    public typealias HomePageStore = StoreOf<HomePageReducer>
    let store: HomePageStore

    public struct ViewState: Equatable {
        var showLoadingIndicator: Bool
        var emptyText: String
        var items: [String]

        var emptyStateText: String? {
            items.count > 0 ? nil : emptyText
        }

        var hasItems: Bool {
            items.count > 0
        }

        public init(state: HomePageReducer.State) {
            showLoadingIndicator = state.loading
            emptyText = state.emty
            items = state.items ?? []
        }
    }

    public enum ViewAction {
        case refresh
        case detailsClick
    }

    public init(store: HomePageStore) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: ViewState.init, send: HomePageReducer.Action.init) { viewStore in
            Group {
                if let empty = viewStore.emptyStateText {
                    LazyVStack {
                        Text(empty)
                    }
                } else {
                    LazyVStack {
                        ForEach(viewStore.items, id: \.self) {
                            Text($0).onTapGesture {
                                viewStore.send(ViewAction.detailsClick)
                            }
                        }
                    }
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewStore.send(ViewAction.refresh)
                }
            }


//            .sheet(
//                isPresented: viewStore.binding(
//                  get: \.isSheetPresented,
//                  send: LoadThenPresent.Action.setSheet(isPresented:)
//                )
//              ) {
//                IfLetStore(
//                  self.store.scope(
//                    state: \.optionalCounter,
//                    action: LoadThenPresent.Action.optionalCounter
//                  )
//                ) {
//                  CounterView(store: $0)
//                }
//              }
//              .navigationTitle("Load and present")
//              .onDisappear { viewStore.send(.onDisappear) }
        }
    }


}

public extension HomePageReducer.Action {
    init(action: HomePageView.ViewAction) {
        switch action {
        case .refresh:
            self = .loadData
        case .detailsClick:
            self = .detail(.doSomething("TEST TEST"))
        }
    }
}

#if DEBUG
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(store: HomePageView.HomePageStore(initialState: HomePageReducer.State(),
                                                       reducer: HomePageReducer()))
    }
}
#endif
