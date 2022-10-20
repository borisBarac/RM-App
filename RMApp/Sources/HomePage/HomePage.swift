import SwiftUI
import ComposableArchitecture

public struct HomePageView: View {
    public struct ViewState: Equatable {
        public init(state: HomePageReducer.State) {
        }
    }

    public enum ViewAction {
    }

    public init() {
    }

    public var body: some View {
        VStack {
            Text("Hello, HomePage")
        }
        .padding()
    }
}

public extension HomePageReducer.Action {
    init(action: HomePageView.ViewAction) {
        switch action {
        default:
            self = .loadData
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
