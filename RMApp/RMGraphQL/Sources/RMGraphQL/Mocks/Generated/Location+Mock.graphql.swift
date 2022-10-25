// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import Api

public class Location: MockObject {
  public static let objectType: Object = Api.Objects.Location
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Location>>

  public struct MockFields {
    @Field<String>("dimension") public var dimension
    @Field<ID>("id") public var id
    @Field<String>("name") public var name
    @Field<[Character?]>("residents") public var residents
  }
}

public extension Mock where O == Location {
  convenience init(
    dimension: String? = nil,
    id: ID? = nil,
    name: String? = nil,
    residents: [Mock<Character>?]? = nil
  ) {
    self.init()
    self.dimension = dimension
    self.id = id
    self.name = name
    self.residents = residents
  }
}
