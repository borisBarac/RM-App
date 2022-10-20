import SwiftUI

public struct HomePageView: View {
    public init() {
    }

    public var body: some View {
        VStack {
            Text("Hello, HomePage")
        }
        .padding()
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
