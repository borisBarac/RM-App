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
            return .full
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
        let name: String
        let status: String
        let image: String?
        let episodes: [String]
        let origin: String
        let neighbours: [Neighbour]
    }

    struct Constants {
        static var cardRoundedRects: CGFloat = 25
        static var cardPadding: CGFloat = 8
        static var erorrAndEmptyCardHeight: CGFloat = 200
    }

    public typealias DetailPageStore = StoreOf<DetailsPageReducer>
    let store: DetailPageStore

    public init(store: DetailPageStore) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: ViewState.init, send: DetailsPageReducer.Action.init) { viewStore in
            VStack {
                Text("Hello, DetailPage")
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
        DetailPageView(store: DetailPageView.DetailPageStore.init(initialState: DetailsPageReducer.State(), reducer: DetailsPageReducer()))
    }
}
#endif
