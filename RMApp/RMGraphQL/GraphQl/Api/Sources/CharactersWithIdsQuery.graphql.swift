// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import Api

public class CharactersWithIdsQuery: GraphQLQuery {
  public static let operationName: String = "CharactersWithIds"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query CharactersWithIds($ids: [ID!]!) {
        Characters: charactersByIds(ids: $ids) {
          __typename
          ...characterBasic
          ...characterEpisode
          ...characterOrigin
        }
      }
      """,
      fragments: [CharacterBasic.self, CharacterEpisode.self, CharacterOrigin.self]
    ))

  public var ids: [Api.ID]

  public init(ids: [Api.ID]) {
    self.ids = ids
  }

  public var __variables: Variables? { ["ids": ids] }

  public struct Data: Api.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { Api.Objects.Query }
    public static var __selections: [Selection] { [
      .field("charactersByIds", alias: "Characters", [Character?]?.self, arguments: ["ids": .variable("ids")]),
    ] }

    /// Get a list of characters selected by ids
    public var characters: [Character?]? { __data["Characters"] }

    /// Character
    ///
    /// Parent Type: `Character`
    public struct Character: Api.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { Api.Objects.Character }
      public static var __selections: [Selection] { [
        .fragment(CharacterBasic.self),
        .fragment(CharacterEpisode.self),
        .fragment(CharacterOrigin.self),
      ] }

      /// The id of the character.
      public var id: Api.ID? { __data["id"] }
      /// The name of the character.
      public var name: String? { __data["name"] }
      /// The status of the character ('Alive', 'Dead' or 'unknown').
      public var status: String? { __data["status"] }
      /// The type or subspecies of the character.
      public var type: String? { __data["type"] }
      /// Link to the character's image.
      /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
      public var image: String? { __data["image"] }
      /// Episodes in which this character appeared.
      public var episode: [CharacterEpisode.Episode?] { __data["episode"] }
      /// The character's origin location
      public var origin: CharacterOrigin.Origin? { __data["origin"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public var characterBasic: CharacterBasic { _toFragment() }
        public var characterEpisode: CharacterEpisode { _toFragment() }
        public var characterOrigin: CharacterOrigin { _toFragment() }
      }
    }
  }
}
