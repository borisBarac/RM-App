// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import Api

public class Episode: MockObject {
  public static let objectType: Object = Api.Objects.Episode
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Episode>>

  public struct MockFields {
    @Field<[Character?]>("characters") public var characters
    @Field<ID>("id") public var id
    @Field<String>("name") public var name
  }
}

public extension Mock where O == Episode {
  convenience init(
    characters: [Mock<Character>?]? = nil,
    id: ID? = nil,
    name: String? = nil
  ) {
    self.init()
    self.characters = characters
    self.id = id
    self.name = name
  }
}
