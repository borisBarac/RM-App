import Foundation

/// Provides event used for analytics in AnalyticsService
public protocol Eventable {
    var analyticsEvent: AnalyticsService.Event? { get }
}

/// Implemnted as a struct to avoid using protocol for this (public protocol is forcing all the properties to be public also)
/// and i find this to be nice workaround
public struct EventLogging {
    let event: AnalyticsService.Event?
    var analyticsService: AnalyticsService?

    public init(event: AnalyticsService.Event? = nil,
                analyticsService: AnalyticsService? = nil) {
        self.event = event
        self.analyticsService = analyticsService
    }

    public func log() {
        if let event, let analyticsService {
            analyticsService.log(event: event)
        }
    }
}
