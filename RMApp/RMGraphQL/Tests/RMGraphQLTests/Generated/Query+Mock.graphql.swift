// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import Api

public class Query: MockObject {
  public static let objectType: Object = Api.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<Characters>("Characters") public var Characters
  }
}

public extension Mock where O == Query {
  convenience init(
    Characters: Mock<Characters>? = nil
  ) {
    self.init()
    self.Characters = Characters
  }
}
