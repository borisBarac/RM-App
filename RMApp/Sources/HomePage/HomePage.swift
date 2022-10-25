import SwiftUI
import ComposableArchitecture

@MainActor
public struct HomePageView: View {
    public typealias HomePageStore = StoreOf<HomePageReducer>
    let store: HomePageStore

    public struct ViewState: Equatable {
        var showLoadingIndicator: Bool
        var detailsPresented: Bool
        var emptyText = "We do not have any data. :("
        var items: [String]

        var emptyStateText: String? { items.count > 0 ? nil : emptyText }
        var hasItems: Bool { items.count > 0 }

        public init(state: HomePageReducer.State) {
            showLoadingIndicator = state.loading
            detailsPresented = state.detailsPresented
            items = state.items?.map { $0.name ?? "" } ?? []
        }
    }

    public enum ViewAction {
        case refresh
        case detailsClick(Bool)
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
                                viewStore.send(ViewAction.detailsClick(true))
                            }
                        }
                    }
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewStore.send(ViewAction.refresh)
                }
            }.sheet(isPresented: viewStore.binding(
                get: \.detailsPresented,
                send: { .detailsClick($0) })
            ) {
                IfLetStore(self.store.scope(state: \.detailState, action: HomePageReducer.Action.detail)) { store in
                    Text("YEEEYYYYEEEYYYYE")
                    Text("!!!!!!! !!!!!!!!!!!!!!!!")
                }
            }
            .navigationTitle("Detail Page")
            .onDisappear {
                viewStore.send(.detailsClick(false))
            }
        }
    }


}

public extension HomePageReducer.Action {
    init(action: HomePageView.ViewAction) {
        switch action {
        case .refresh:
            self = .loadData
        case .detailsClick(let presented):
            self = .setDetailsPresented(presented)
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
