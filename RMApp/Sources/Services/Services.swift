
import Foundation
import RMGraphQL
import ComposableArchitecture
import Helpers
import Combine

public class RMRepository {
    public typealias RMEffect = AnyPublisher<[String], Never>

    public func repositoryEffect() -> RMEffect {
        Just(["f1", "f2", "f3"]).eraseToAnyPublisher()
    }

    public func dummyRepositoryEffect() -> RMEffect {
        repositoryEffect()
    }

}

extension RMRepository: DependencyKey {
    public static let liveValue = RMRepository()
    public static let testValue = RMRepository()
}

public extension DependencyValues {
    var rmRepository: RMRepository {
        get { self[RMRepository.self] }
        set { self[RMRepository.self] = newValue }
    }
}
