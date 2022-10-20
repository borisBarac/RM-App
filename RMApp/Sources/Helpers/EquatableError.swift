
// Idea came from here
// https://twittemb.github.io/posts/2021-12-10-EquatableError/

public struct EquatableError: Error, Equatable {
    public let base: Error
    private let equals: (Error) -> Bool

    var description: String {
        "\(self.base)"
    }

    public init<Base: Error>(_ base: Base) {
        self.base = base
        self.equals = { String(reflecting: $0) == String(reflecting: base) }
    }

    public init<Base: Error & Equatable>(_ base: Base) {
        self.base = base
        self.equals = { ($0 as? Base) == base }
    }

    public static func == (lhs: EquatableError, rhs: EquatableError) -> Bool {
        lhs.equals(rhs.base)
    }

    public func asError<Base: Error>(type: Base.Type) -> Base? {
        self.base as? Base
    }
}

public extension Error where Self: Equatable {
    func toEquatableError() -> EquatableError {
        EquatableError(self)
    }
}

public extension Error {
    func toEquatableError() -> EquatableError {
        EquatableError(self)
    }
}
