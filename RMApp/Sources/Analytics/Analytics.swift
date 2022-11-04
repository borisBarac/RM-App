import Foundation
import ComposableArchitecture

// this protocol would need to implemented for every service we are using
// like Kinesis, Firebase, AppDymacis, anything that is gonna record our custom events
protocol AnalyticLogService {
    func log(event: AnalyticsService.Event)
}

enum AnalyticsError: Error {
    case couldNotLog
    case attachmentEncodingError
}

public class AnalyticsService {

    var services: [AnalyticLogService]
    var history = [Event]()

    public enum EventSeverity: Int {
        case low
        case normal
        case high
        case critical
    }

    public enum EventType: Int {
        case info
        case error
        case normal
    }

    public struct Event {
        let eventType: EventType
        let eventSeverity: EventSeverity
        let message: String
        let attachment: Codable?
        let file: String
        let line: Int

        public init(eventType: AnalyticsService.EventType,
                    eventSeverity: AnalyticsService.EventSeverity,
                    message: String,
                    attachment: Codable? = nil,
                    file: String = #file,
                    line: Int = #line) {
            self.eventType = eventType
            self.eventSeverity = eventSeverity
            self.message = message.isEmpty ? "No message" : message
            self.attachment = attachment
            self.file = file
            self.line = line
        }

    }

    public init() {
        self.services = [FakeFirebase()]
    }

    init(services: [AnalyticLogService]) {
        self.services = services
    }

    public func log(event: Event) {
        services.forEach {
            $0.log(event: event)
        }

        history.append(event)
    }
}

// MARK: - Attachment encoding
extension AnalyticsService.Event {
    // static to save memory, and we do not really need to mock it anyway
    static let jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .base64
        return encoder
    }()

    static func endcode(attachment: Codable) throws -> String? {
        do {
            let data = try jsonEncoder.encode(attachment)
            return String(data: data, encoding: .utf8)
        } catch {
            throw AnalyticsError.attachmentEncodingError
        }
    }

    var encodedAttachment: String? {
        guard let attachment = attachment else {
            return nil
        }
        do {
            return try AnalyticsService.Event.endcode(attachment: attachment)
        } catch {
            return "ENCODING ERROR"
        }
    }
}

// MARK: - FakeFirebase setup
class FakeFirebase: AnalyticLogService {
    func log(event: AnalyticsService.Event) {
        debugPrint(
                """
                Logged event:
                type: \(event.eventType)
                eventSeverity: \(event.eventSeverity)
                in: \(event.file) : \(event.line)
                message: \(event.message)
                attachment: \(event.encodedAttachment ?? "nothig here")
                """
        )
    }
}

// MARK: - Dependency injection set up

extension AnalyticsService: DependencyKey {
    public static var liveValue = AnalyticsService()
    public static var previewValue = AnalyticsService()
    public static var testValue = AnalyticsService()
}

extension DependencyValues {
  public var rmCharacterService: AnalyticsService {
    get { self[AnalyticsService.self] }
    set { self[AnalyticsService.self] = newValue }
  }
}
