import XCTest
import Api
@testable import RMGraphQL

/// This mocks are used by clients of the library in their tests
/// so if they break, our upper service testes are gonna break also
final class QueryMocksTests: XCTestCase {

    func testCharactersForPageMock() async throws {
        let mock = charactersPageMock()
        XCTAssertTrue((mock.characters.map {$0.name}).count > 0)
        XCTAssertNotNil(mock.info)
    }

    func testCharactersWithIdsMock() async throws {
        let mock = charactersWithIdsMock()
        XCTAssertTrue((mock.compactMap { $0.name }).count > 0)
    }

}
