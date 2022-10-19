import SwiftUI

public struct AppCoreView: View {
    public init() {
    }

    public var body: some View {
        VStack {
            Text("Hello, world!")
            Text("Hello, Hello, Hello!!!")
        }
        .padding()
    }
}

struct AppCoreView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoreView()
    }
}
