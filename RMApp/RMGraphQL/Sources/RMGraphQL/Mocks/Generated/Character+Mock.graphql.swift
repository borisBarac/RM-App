// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import Api

public class Character: MockObject {
  public static let objectType: Object = Api.Objects.Character
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Character>>

  public struct MockFields {
    @Field<[Episode?]>("episode") public var episode
    @Field<ID>("id") public var id
    @Field<String>("image") public var image
    @Field<String>("name") public var name
    @Field<Location>("origin") public var origin
    @Field<String>("status") public var status
    @Field<String>("type") public var type
  }
}

public extension Mock where O == Character {
  convenience init(
    episode: [Mock<Episode>?]? = nil,
    id: ID? = nil,
    image: String? = nil,
    name: String? = nil,
    origin: Mock<Location>? = nil,
    status: String? = nil,
    type: String? = nil
  ) {
    self.init()
    self.episode = episode
    self.id = id
    self.image = image
    self.name = name
    self.origin = origin
    self.status = status
    self.type = type
  }
}
