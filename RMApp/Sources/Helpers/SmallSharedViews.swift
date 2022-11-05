import SwiftUI
import SDWebImageSwiftUI

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

public struct SmallRoundedTextViewForTags: View {

    var text: String

    public init(text: String) {
        self.text = text
    }

    public var body: some View {
        Text(self.text)
            .padding(EdgeInsets(top: 3, leading: 6, bottom: 3, trailing: 6))
            .font(.body)
            .foregroundColor(.label)
            .overlay {
                RoundedRectangle(cornerRadius: 12.5)
                    .stroke(.primary, lineWidth: 1)
            }

    }
}

public struct RMImage: View {
    var url: URL

    public init(url: URL) {
        self.url = url
    }

    public var body: some View {
        WebImage(url: url)
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
    }
}
