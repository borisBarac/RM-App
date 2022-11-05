
// we need this because xcode likes to be xcode
@_implementationOnly
import AppCore
import SwiftUI

@main
struct RickAndMortyAppApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoreView()
        }
    }
}
