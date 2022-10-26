import SwiftUI
import ComposableArchitecture
import Helpers

@MainActor
public struct HomePageView: View {
    struct ViewState: Equatable {
        var showLoadingIndicator: Bool
        var eqError: EquatableError?
        var detailsPresented: Bool
        var currentPage: Int
        var emptyText = "No Ricks here so far..."
        var items: [CellModel]

        var emptyStateText: String? { items.count > 0 ? nil : emptyText }
        var hasItems: Bool { items.count > 0 }
        var viewRenderType: ViewRenderType {
            guard showLoadingIndicator == false else {
                return .loading
            }
            if eqError != nil {
                return .error
            }
            return hasItems ? .full : .empty
        }

        public init(state: HomePageReducer.State) {
            showLoadingIndicator = state.loading
            eqError = state.error
            detailsPresented = state.detailsPresented
            currentPage = state.currentPage
            items = state.getItems(page: currentPage).map {
                CellModel(id: Int($0.id!) ?? 0,
                          name: $0.name ?? "",
                          url: "",
                          origin: $0.origin?.name ?? "We do not know")
            }
        }
    }

    enum ViewAction {
        case refresh
        case loadNextPage(Int)
        case detailsClick(Bool)
    }

    enum ViewRenderType {
        case error
        case empty
        case full
        case loading
    }

    struct CellModel: Identifiable, Comparable, Hashable {
        let id: Int
        let name: String
        let url: String
        let origin: String

        static func < (lhs: HomePageView.CellModel, rhs: HomePageView.CellModel) -> Bool {
            rhs.id == lhs.id
        }
    }

    public typealias HomePageStore = StoreOf<HomePageReducer>
    let store: HomePageStore

    public init(store: HomePageStore) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: ViewState.init, send: HomePageReducer.Action.init) { viewStore in
            createMainBody(viewStore: viewStore)
                .onAppear {
                    viewStore.send(ViewAction.refresh)
                }
                .sheet(isPresented: viewStore.binding(
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

    // MARK: - View builder helpers
    @ViewBuilder
    private func createMainBody(viewStore: ViewStore<ViewState, ViewAction>) -> some View {
        switch viewStore.viewRenderType {
        case .loading:
            VStack(spacing: 16) {
                ProgressView().scaleEffect(2)
                Text("Loading")
                    .font(.title2)
            }
        case .error:
            VStack(alignment: .center, spacing: 8) {
                Text("Something went wrong :(")
                    .font(.title2)
                    .foregroundColor(.primary)
                Text(viewStore.state.eqError?.localizedDescription ?? "I do not have more details")
                    .font(.title3)
                    .foregroundColor(.secondary)
                Button("Retry") {
                    viewStore.send(.refresh)
                }
                .font(.title3)
            }
        case .empty:
            HStack(alignment: .center, spacing: 8) {
                Text(viewStore.emptyText)
                    .font(.title2)
            }
        case .full:
            createFullBody(viewStore: viewStore)
        }
    }

    @ViewBuilder
    private func createFullBody(viewStore: ViewStore<ViewState, ViewAction>) -> some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridItemLayout) {
                ForEach(viewStore.items, id: \.self) { item in
                    Button {
                        viewStore.send(ViewAction.detailsClick(true))
                    } label: {
                        VStack(alignment: .center, spacing: 4) {
                            AsyncImage(
                                url: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            Text(item.name)
                            Text(item.origin)
                        }
                    }
                }
            }
        }.refreshable {
            viewStore.send(.refresh)
        }
    }

#if (os(iOS) || targetEnvironment(macCatalyst))
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    private var gridItemLayout: [GridItem] {
        horizontalSizeClass == .regular ?
        [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        : [GridItem(.flexible())]
    }
#else
    private var gridItemLayout: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    }
#endif

}

extension HomePageReducer.Action {
    init(action: HomePageView.ViewAction) {
        switch action {
        case .refresh:
            // reload and remake evetyhing
            // We set up the network manager to retry 3 times for failed request
            // plus we have caching, so this should not really happen
            self = .loadData(0)
        case .loadNextPage(let page):
            self = .loadData(page)
        case .detailsClick(let presented):
            self = .setDetailsPresented(presented)
        }
    }
}

#if DEBUG
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(store: HomePageView.HomePageStore(initialState: HomePageReducer.State(),
                                                       reducer: HomePageReducer())
        )
    }
}
#endif
