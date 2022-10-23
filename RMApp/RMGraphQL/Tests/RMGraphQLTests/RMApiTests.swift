import XCTest
import Api
@testable import RMGraphQL

final class RMApiTests: XCTestCase {
    var rmApi: RMApi!

    override func setUp() async throws {
        try await super.setUp()
    }

    override func tearDown() async throws {
        try await super.tearDown()
    }

    func testInit() throws {
        let config = RMApiConfig(endpont: rmApiEndpont, loggingLevel: .all, cashingStrategy: .inMemory)
        let api = try? RMApi(config: config)
        XCTAssertNotNil(api)
    }

    #warning("SHOULD NOT RUN IN CI")
    func testGetCharactersWithPage() async throws {
        rmApi = makeLiveSUT()
        let data = try? await rmApi.getCharacters(page: 0)
        XCTAssertNotNil(data, "Data is NULL")

        let firstCharacter: RMApi.CharacterPageObject? = data?.first
        XCTAssertNotNil(firstCharacter)
        XCTAssertNotNil(firstCharacter!.episode)
        XCTAssertNotNil(firstCharacter!.origin)
    }

    #warning("SHOULD NOT RUN IN CI")
    func testGetCharactersWithIds() async throws {
        rmApi = makeLiveSUT()
        let data = try? await rmApi.getCharacters(withIds: [1, 2, 3])
        XCTAssertNotNil(data, "Data is NULL")

        let firstCharacter: RMApi.CharactersWithIdsObject? = data?.first
        XCTAssertNotNil(firstCharacter)
        XCTAssertNotNil(firstCharacter!.episode)
        XCTAssertNotNil(firstCharacter!.origin)
    }

    func testCharactersPageMockPass() async throws {
        rmApi = makeMockSUT(mockPass: true)
        let data = try? await rmApi.getCharacters(page: 0)
        XCTAssertNotNil(data, "Data is NULL")
    }

    func testCharactersWithIdsMockPass() async throws {
        rmApi = makeMockSUT(mockPass: true, mockString: MOCK_STRING_CHARACTERS_PAGE)
        let data = try? await rmApi.getCharacters(page: 0)
        XCTAssertNotNil(data, "Data is NULL")
    }

    func testMockFail() async throws {
        rmApi = makeMockSUT(mockPass: false)
        do {
            let _ = try await rmApi.getCharacters(page: 0)
        } catch(let error) {
            XCTAssertNotNil(error)
        }
    }

    // MARK: - Helpers
    func makeLiveSUT() -> RMApi {
        let config = RMApiConfig(endpont: rmApiEndpont,
                                 loggingLevel: .none,
                                 cashingStrategy: .inMemory)
        let api = try? RMApi(config: config)
        assert(api != nil, "COULD NOT MAKE SUT")
        return api!
    }

    func makeMockSUT(mockPass: Bool, mockString: String = MOCK_STRING_CHARACTERS_PAGE) -> RMApi {
        let mock = mockPass ? MockInterceptor.passMock(with: mockString) : MockInterceptor.failMock()
        let config = RMApiConfig(endpont: rmApiEndpont,
                                 loggingLevel: .none,
                                 cashingStrategy: .none,
                                 mockInterceptor: mock)
        let api = try? RMApi(config: config)

        assert(api != nil, "COULD NOT MAKE SUT")
        return api!
    }
}
