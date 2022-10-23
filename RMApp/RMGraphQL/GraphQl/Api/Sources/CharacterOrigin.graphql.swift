// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import Api

public struct CharacterOrigin: Api.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment characterOrigin on Character {
      __typename
      origin {
        __typename
        id
        name
        dimension
        residents {
          __typename
          id
          name
          image
        }
      }
    }
    """ }

  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ParentType { Api.Objects.Character }
  public static var __selections: [Selection] { [
    .field("origin", Origin?.self),
  ] }

  /// The character's origin location
  public var origin: Origin? { __data["origin"] }

  /// Origin
  ///
  /// Parent Type: `Location`
  public struct Origin: Api.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { Api.Objects.Location }
    public static var __selections: [Selection] { [
      .field("id", Api.ID?.self),
      .field("name", String?.self),
      .field("dimension", String?.self),
      .field("residents", [Resident?].self),
    ] }

    /// The id of the location.
    public var id: Api.ID? { __data["id"] }
    /// The name of the location.
    public var name: String? { __data["name"] }
    /// The dimension in which the location is located.
    public var dimension: String? { __data["dimension"] }
    /// List of characters who have been last seen in the location.
    public var residents: [Resident?] { __data["residents"] }

    /// Origin.Resident
    ///
    /// Parent Type: `Character`
    public struct Resident: Api.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { Api.Objects.Character }
      public static var __selections: [Selection] { [
        .field("id", Api.ID?.self),
        .field("name", String?.self),
        .field("image", String?.self),
      ] }

      /// The id of the character.
      public var id: Api.ID? { __data["id"] }
      /// The name of the character.
      public var name: String? { __data["name"] }
      /// Link to the character's image.
      /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
      public var image: String? { __data["image"] }
    }
  }
}
