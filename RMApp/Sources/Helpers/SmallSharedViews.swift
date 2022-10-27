import SwiftUI

// ---------------------------------------
// if the project was bigger and more complex this should be a separate library in the RMApp Package
// ---------------------------------------

public struct CardView<Content: View>: View {
    var cornerRadius: CGFloat = 0
    var content: () -> Content

    public init(cornerRadius: CGFloat = 0,
                content: @escaping () -> Content) {
        self.cornerRadius = cornerRadius
        self.content = content
    }

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(Color.secondarySystemFill)
                .shadowWithNeumorphismStyle()
            content()
        }
    }
}

public struct LoadingView: View {

    public init() {
    }

    public var body: some View {
        CardView(cornerRadius: 25) {
            VStack(spacing: 16) {
                ProgressView()
                    .scaleEffect(2)
                    .foregroundColor(.primary)
                Text("Loading")
                    .font(.title2)
                    .foregroundColor(.label)
            }
        }.frame(width: 150, height: 150, alignment: .center)
    }
}

