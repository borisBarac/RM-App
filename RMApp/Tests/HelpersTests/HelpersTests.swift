import SwiftUI

import SnapshotTesting
import XCTest
@testable import Helpers

#if os(iOS)
final class HelpersTests: XCTestCase {
    func testLoadingViewImage() throws {
        let vc = UIHostingController(rootView: LoadingView())
        assertSnapshot(matching: vc, as: .image(size: CGSize(width: 250, height: 250)))
    }

}
#endif
