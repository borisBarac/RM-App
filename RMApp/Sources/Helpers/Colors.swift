import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

public struct Theme {
    @Environment(\.colorScheme) var colorScheme
    private var isDark: Bool {
        colorScheme == .dark
    }

    public var backgroundColor: Color {
        isDark ? .black : .white
    }

    public var textColor: Color {
        isDark ? .white : .black
    }

}

#if canImport(UIKit)
public extension UIColor {
    func inverse () -> UIColor {
        var r:CGFloat = 0.0; var g:CGFloat = 0.0; var b:CGFloat = 0.0; var a:CGFloat = 0.0;
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: 1.0-r, green: 1.0 - g, blue: 1.0 - b, alpha: a)
        }
        return .black // Return a default colour
    }
}
#endif
