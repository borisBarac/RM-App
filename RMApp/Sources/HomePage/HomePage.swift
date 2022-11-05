import SwiftUI
import ComposableArchitecture
import DetailsPage
import Helpers

@MainActor
public struct HomePageView: View {
    struct ViewState: Equatable {
        var showLoadingIndicator: Bool
        var eqError: EquatableError?
        var detailsPresentedId: Int?
        var currentPage: Int
        var emptyText = "No Ricks here so far..."
        var items: [CellModel]

        var detailsPresented: Bool { detailsPresentedId != nil }
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
            detailsPresentedId = state.detailState?.id
            currentPage = state.currentPage
            items = state.getItems(page: currentPage).map {
                CellModel(id: Int($0.id!) ?? 0,
                          name: $0.name ?? "",
                          url: $0.image ?? "",
                          origin: $0.origin?.name ?? "We do not know")
            }
        }
    }

    enum ViewAction {
        case refresh
        case loadNextPage(Int)
        case detailsClick(Int?)
    }

    enum ViewRenderType {
        case error
        case empty
        case full
        case loading
    }

    struct CellModel: Identifiable, Equatable, Hashable {
        let id: Int
        let name: String
        let url: String
        let origin: String

        static func == (lhs: HomePageView.CellModel, rhs: HomePageView.CellModel) -> Bool {
            rhs.id == lhs.id
        }
    }

    struct Constants {
        static var cardRoundedRects: CGFloat = 25
        static var cardPadding: CGFloat = 8
        static var erorrAndEmptyCardHeight: CGFloat = 200
    }

    public typealias HomePageStore = StoreOf<HomePageReducer>
    let store: HomePageStore

    public init(store: HomePageStore) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: ViewState.init, send: HomePageReducer.Action.init) { viewStore in
            ZStack {
                Color.systemFill
                    .ignoresSafeArea()
                createMainBody(viewStore: viewStore)
            }
            .onAppear {
                viewStore.send(ViewAction.refresh)
            }
            .sheet(isPresented: viewStore.binding(get: \.detailsPresented,
                                                  send: { .detailsClick(viewStore.detailsPresentedId) }()
                                                 )
            ) {
                IfLetStore(self.store.scope(state: \.detailState, action: HomePageReducer.Action.detail)) { store in
                    DetailPageView(store: store).onDisappear {
                        viewStore.send(.detailsClick(nil))
                    }
                }
            }
            .navigationTitle("Detail Page")
        }
    }

    // MARK: - View builder helpers
    @ViewBuilder
    private func createMainBody(viewStore: ViewStore<ViewState, ViewAction>) -> some View {
        switch viewStore.viewRenderType {
        case .loading:
            LoadingView()
        case .error:
            CardView(cornerRadius: Constants.cardRoundedRects, content: {
                VStack(alignment: .center, spacing: 8) {
                    Text("Something went wrong :(")
                        .font(.title2)
                        .foregroundColor(.label)
                    Text(viewStore.state.eqError?.localizedDescription ?? "I do not have more details")
                        .font(.title3)
                        .foregroundColor(.secondaryLabel)
                    Button("Retry") {
                        viewStore.send(.refresh)
                    }
                    .font(.title3)
                    .foregroundColor(.systemBlue)
                }
            })
            .frame(height: Constants.erorrAndEmptyCardHeight)
            .padding(.leading, Constants.cardPadding)
            .padding(.trailing, Constants.cardPadding)
        case .empty:
            CardView(cornerRadius: Constants.cardRoundedRects, content: {
                Text(viewStore.emptyText)
                    .font(.title2)
            })
            .frame(height: Constants.erorrAndEmptyCardHeight)
            .padding(.leading, Constants.cardPadding)
            .padding(.trailing, Constants.cardPadding)
        case .full:
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(viewStore.items, id: \.self) { item in
                        makeCellViewFor(item, with: viewStore)
                    }
                }
            }.refreshable {
                viewStore.send(.refresh)
            }
        }
    }

    @ViewBuilder
    private func makeCellViewFor(_ item: HomePageView.CellModel, with viewStore: ViewStore<ViewState, ViewAction>) -> some View {
        CardView(cornerRadius: Constants.cardRoundedRects) {
            LazyVStack(alignment: .center, spacing: 4) {
                if let imageUrl = URL(string: item.url) {
                    RMImage(url: imageUrl)
                }
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.label)
                Text(item.origin)
                    .font(.subheadline)
                    .foregroundColor(.secondaryLabel)
            }.padding(16)
        }
        .padding(.leading, Constants.cardPadding)
        .padding(.trailing, Constants.cardPadding)
        .onTapGesture {
            viewStore.send(ViewAction.detailsClick(item.id))
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
