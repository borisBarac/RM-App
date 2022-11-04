import XCTest
@testable import Analytics

final class AnalyticsTests: XCTestCase {

    struct FakeDogClass: Codable {
        let name: String
        func bark() {}
    }

    func test() throws {
        struct CallBackTest: AnalyticLogService {
            static var called = false
            func log(event: AnalyticsService.Event) {
                CallBackTest.called = true
            }
        }

        let anatytics = AnalyticsService(services: [FakeFirebase(), CallBackTest()])
        let event = AnalyticsService.Event(eventType: .error,
                                           eventSeverity: .critical,
                                           message: "WOF WOOFFFF",
                                           attachment: FakeDogClass(name: "Barky"))
        anatytics.log(event: event)
        let loggedEvent = anatytics.history.first

        XCTAssertNotNil(loggedEvent)
        XCTAssertNotNil(loggedEvent?.encodedAttachment)
        XCTAssertNotEqual(loggedEvent?.encodedAttachment, "ENCODING ERROR")

    }
}
