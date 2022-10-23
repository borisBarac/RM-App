// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import Api

public struct CharacterEpisode: Api.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment characterEpisode on Character {
      __typename
      episode {
        __typename
        id
        name
        characters {
          __typename
          id
        }
      }
    }
    """ }

  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ParentType { Api.Objects.Character }
  public static var __selections: [Selection] { [
    .field("episode", [Episode?].self),
  ] }

  /// Episodes in which this character appeared.
  public var episode: [Episode?] { __data["episode"] }

  /// Episode
  ///
  /// Parent Type: `Episode`
  public struct Episode: Api.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { Api.Objects.Episode }
    public static var __selections: [Selection] { [
      .field("id", Api.ID?.self),
      .field("name", String?.self),
      .field("characters", [Character?].self),
    ] }

    /// The id of the episode.
    public var id: Api.ID? { __data["id"] }
    /// The name of the episode.
    public var name: String? { __data["name"] }
    /// List of characters who have been seen in the episode.
    public var characters: [Character?] { __data["characters"] }

    /// Episode.Character
    ///
    /// Parent Type: `Character`
    public struct Character: Api.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { Api.Objects.Character }
      public static var __selections: [Selection] { [
        .field("id", Api.ID?.self),
      ] }

      /// The id of the character.
      public var id: Api.ID? { __data["id"] }
    }
  }
}
