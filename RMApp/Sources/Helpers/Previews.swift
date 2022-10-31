import SwiftUI

public var iPhone11PreviewDevice: PreviewDevice {
    PreviewDevice(rawValue: "iPhone 11")
}

public var iPadAirPreviewDevice: PreviewDevice {
    PreviewDevice(rawValue: "iPad Pro (11-inch)")
}

public var isRunningInPreview: Bool {
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}
