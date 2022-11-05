import SwiftUI
import ComposableArchitecture
import Services
import Helpers

public struct DetailPageView: View {
    struct ViewState: Equatable {
        var showLoadingIndicator: Bool
        var eqError: EquatableError?
        var item: DetailModel
        var viewRenderType: ViewRenderType {
            guard showLoadingIndicator == false else {
                return .loading
            }
            if eqError != nil {
                return .error
            }
            return isEmpty ? .error : .full
        }

        // we checked this because the state is basically empty before we send the action with the ID
        var isEmpty: Bool {
            item.name.isEmpty
        }

        public init(state: DetailsPageReducer.State) {
            showLoadingIndicator = state.isLoading
            eqError = state.error
            item = DetailModel(item: state.detailItem)
        }
    }

    enum ViewAction {
        case loadDetailsWithId(Int)
    }

    enum ViewRenderType {
        case error
        case full
        case loading
    }

    struct DetailModel: Equatable {
        struct Neighbour: Equatable {
            let id: Int
            let name: String
            let image: String?
        }
        let id: Int
        let name: String
        let status: String
        let image: String?
        let episodes: [String]
        let origin: String
        let neighbours: [Neighbour]

        var neighboursImageUrls: [URL] {
            neighbours.compactMap { $0.image }.compactMap {
                URL(string: $0)
            }
        }
    }

    struct Constants {
        static var cardRoundedRects: CGFloat = 25
        static var cardPadding: CGFloat = 8
        static var stackSpacing: CGFloat = 8
        static var erorrAndEmptyCardHeight: CGFloat = 200
        static var neighbourImageLengts: CGFloat = 200
    }

    public typealias DetailPageStore = StoreOf<DetailsPageReducer>
    let store: DetailPageStore

    public init(store: DetailPageStore) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: ViewState.init, send: DetailsPageReducer.Action.init) { viewStore in
            Group {
                switch viewStore.viewRenderType {
                case .loading:
                    LoadingView()
                case .error:
                    CardView(cornerRadius: Constants.cardRoundedRects, content: {
                        VStack(alignment: .center, spacing: Constants.stackSpacing) {
                            Text("Something went wrong :(")
                                .font(.title2)
                                .foregroundColor(.label)
                            Text(viewStore.state.eqError?.localizedDescription ?? "We can not find details about this person")
                                .font(.title3)
                                .foregroundColor(.secondaryLabel)

                                // Maybe add go back button here, but i do not see much point for this page,
                                // user would need to go back anyway

                        }
                    })
                    .frame(height: Constants.erorrAndEmptyCardHeight)
                    .padding(.leading, Constants.cardPadding)
                    .padding(.trailing, Constants.cardPadding)
                case .full:
                    makeDetailViewFor(viewStore.state.item, with: viewStore)
                }
            }.onAppear {
                if isRunningInPreview {
                    viewStore.send(.loadDetailsWithId(2))
                } else {
                    // load is gonna get called from the HomePage reducer
                }
            }
        }
    }

    // MARK: - View builder helpers
    @ViewBuilder
    private func makeDetailViewFor(_ item: DetailModel, with viewStore: ViewStore<ViewState, ViewAction>) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Constants.stackSpacing * 2) {
                Spacer(minLength: 8)
                Capsule(style: .circular)
                    .frame(width: 40)
                    .foregroundColor(Color.systemFill)
                CardView(cornerRadius: Constants.cardRoundedRects) {
                    VStack(alignment: .center, spacing: Constants.stackSpacing * 1.5) {
                        AsyncImage(
                            url: URL(string: item.image!)!,
                            content: { image in
                                image.resizable()
                                    .cornerRadius(Constants.cardRoundedRects / 2)
                                    .aspectRatio(contentMode: .fit)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        Text(item.name)
                            .font(.headline)
                            .foregroundColor(.label)
                        Text(item.origin)
                            .font(.subheadline)
                            .foregroundColor(.secondaryLabel)

                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(item.episodes, id: \.self) {
                                    SmallRoundedTextViewForTags(text: $0)
                                }
                            }
                        }

                        VStack(alignment: .center, spacing: Constants.stackSpacing) {
                            if item.neighboursImageUrls.isEmpty {
                                Text("This Rick is living alone")
                            } else {
                                Text("Neighbours")
                                    .foregroundColor(.label)
                                    .font(.headline)
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(item.neighboursImageUrls, id: \.self) { url in
                                            AsyncImage(
                                                url: url,
                                                content: { image in
                                                    image.resizable()
                                                        .cornerRadius(Constants.cardRoundedRects / 2)
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: Constants.neighbourImageLengts,
                                                               height: Constants.neighbourImageLengts,
                                                               alignment: .center)
                                                },
                                                placeholder: {
                                                    ProgressView()
                                                }
                                            )
                                            .padding(.leading, Constants.cardPadding)
                                            .padding(.trailing, Constants.cardPadding)
                                        }
                                    }
                                }
                            }
                        }

                    }.padding(Constants.cardPadding * 2)
                }
                .padding(.leading, Constants.cardPadding)
                .padding(.trailing, Constants.cardPadding)

            }
        }

    }
}

extension DetailsPageReducer.Action {
    init(action: DetailPageView.ViewAction) {
        switch action {
        case .loadDetailsWithId(let detailsId):
            self = .loadWithId(detailsId)
        }
    }
}

extension DetailPageView.DetailModel {
    init(item: GQLCharactersWithIdsObject?) {
        let neighbours: [DetailPageView.DetailModel.Neighbour] = item?.origin?.residents.compactMap { opResident in
            let resident = opResident!
            let id: String = resident.id ?? "-1"
            let intId = Int(id)
            return DetailPageView.DetailModel.Neighbour(id: intId ?? -1, name: resident.name ?? "", image: resident.image)
        } ?? []

        self.id = Int(item?.id ?? "") ?? -1
        self.name = item?.name ?? ""
        self.status = item?.status ?? ""
        self.image = item?.image
        self.episodes = item?.episode.compactMap { $0?.name } ?? []
        self.origin = item?.origin?.name ?? ""
        self.neighbours = neighbours
    }
}

#if DEBUG
struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
            DetailPageView(store: DetailPageView.DetailPageStore.init(initialState: DetailsPageReducer.State(),
                                                                      reducer: DetailsPageReducer()))

    }
}
#endif
