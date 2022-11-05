import SwiftUI

import SnapshotTesting
import XCTest
@testable import Helpers

/*
 We can scale this approach super easy to other custom views (cells, headers and so),
 especially because we are using UIModels in all the places
 */

#if os(iOS)
final class HelpersTests: XCTestCase {
    func testLoadingViewImage() throws {
        let vc = UIHostingController(rootView: LoadingView())
        assertSnapshot(matching: vc, as: .image(size: CGSize(width: 250, height: 250)))
    }

    func testTagText() throws {
        let vc = UIHostingController(rootView: SmallRoundedTextViewForTags(text: "TAG TEXT GOES HERE"))
        assertSnapshot(matching: vc, as: .image(size: CGSize(width: 100, height: 30)))
    }

}
#endif
