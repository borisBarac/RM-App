// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import Api

public class CharactersForPageQuery: GraphQLQuery {
  public static let operationName: String = "CharactersForPage"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query CharactersForPage($page: Int = 0) {
        Characters: characters(page: $page) {
          __typename
          results {
            __typename
            ...characterBasic
            ...characterEpisode
            ...characterOrigin
          }
        }
      }
      """,
      fragments: [CharacterBasic.self, CharacterEpisode.self, CharacterOrigin.self]
    ))

  public var page: GraphQLNullable<Int>

  public init(page: GraphQLNullable<Int> = 0) {
    self.page = page
  }

  public var __variables: Variables? { ["page": page] }

  public struct Data: Api.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { Api.Objects.Query }
    public static var __selections: [Selection] { [
      .field("characters", alias: "Characters", Characters?.self, arguments: ["page": .variable("page")]),
    ] }

    /// Get the list of all characters
    public var characters: Characters? { __data["Characters"] }

    /// Characters
    ///
    /// Parent Type: `Characters`
    public struct Characters: Api.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { Api.Objects.Characters }
      public static var __selections: [Selection] { [
        .field("results", [Result?]?.self),
      ] }

      public var results: [Result?]? { __data["results"] }

      /// Characters.Result
      ///
      /// Parent Type: `Character`
      public struct Result: Api.SelectionSet {
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
}
