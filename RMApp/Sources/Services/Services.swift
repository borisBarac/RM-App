
import Foundation
import RMGraphQL
import ComposableArchitecture
import Helpers
import Combine
import XCTestDynamicOverlay

// this would need to be mapped to some ENV variable
// example setUp - https://gist.githubusercontent.com/Sorix/21e61347f478ae2e83ef4d8a92d933af/raw/b0c65a3bdd7098af1e67048136a221cbb00ba0b7/Package.swift
let rmApiEndpont = URL(string: "https://rickandmortyapi.graphcdn.app/")!

//DUMMY FOR TESTING

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
