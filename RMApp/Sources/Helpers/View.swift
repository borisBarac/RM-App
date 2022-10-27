import SwiftUI

// more Neumorphism examples - https://github.com/twostraws/NeumorphismSwiftUI
public struct ShadowWithNeumorphismStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}
public extension View {
    func shadowWithNeumorphismStyle() -> some View {
        modifier(ShadowWithNeumorphismStyle())
    }
}
