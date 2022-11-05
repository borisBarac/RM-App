import SwiftUI
import HomePage

public struct AppCoreView: View {
    public init() {
    }

    public var body: some View {
        HomePageView(store: HomePageView.HomePageStore(initialState: HomePageReducer.State(),
                                                       reducer: HomePageReducer()))
    }
}

struct AppCoreView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoreView()
    }
}
