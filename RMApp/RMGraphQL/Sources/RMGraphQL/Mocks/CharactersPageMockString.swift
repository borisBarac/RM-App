import Foundation

/*
 query CharactersForPage1111($page: Int = 0) {
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
 */

public var MOCK_STRING_CHARACTERS_PAGE: String {
    """
    {
      "data": {
        "Characters": {
          "__typename": "Characters",
          "results": [
            {
              "__typename": "Character",
              "id": "1",
              "name": "Rick Sanchez",
              "status": "Alive",
              "type": "",
              "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
              "episode": [
                {
                  "__typename": "Episode",
                  "id": "1",
                  "name": "Pilot",
                  "characters": [
                    {
                      "__typename": "Character",
                      "id": "1"
                    },
                    {
                      "__typename": "Character",
                      "id": "2"
                    },
                    {
                      "__typename": "Character",
                      "id": "35"
                    },
                    {
                      "__typename": "Character",
                      "id": "38"
                    },
                    {
                      "__typename": "Character",
                      "id": "62"
                    },
                    {
                      "__typename": "Character",
                      "id": "92"
                    },
                    {
                      "__typename": "Character",
                      "id": "127"
                    },
                    {
                      "__typename": "Character",
                      "id": "144"
                    },
                    {
                      "__typename": "Character",
                      "id": "158"
                    },
                    {
                      "__typename": "Character",
                      "id": "175"
                    },
                    {
                      "__typename": "Character",
                      "id": "179"
                    },
                    {
                      "__typename": "Character",
                      "id": "181"
                    },
                    {
                      "__typename": "Character",
                      "id": "239"
                    },
                    {
                      "__typename": "Character",
                      "id": "249"
                    },
                    {
                      "__typename": "Character",
                      "id": "271"
                    },
                    {
                      "__typename": "Character",
                      "id": "338"
                    },
                    {
                      "__typename": "Character",
                      "id": "394"
                    },
                    {
                      "__typename": "Character",
                      "id": "395"
                    },
                    {
                      "__typename": "Character",
                      "id": "435"
                    }
                  ]
                },
                {
                  "__typename": "Episode",
                  "id": "2",
                  "name": "Lawnmower Dog",
                  "characters": [
                    {
                      "__typename": "Character",
                      "id": "1"
                    },
                    {
                      "__typename": "Character",
                      "id": "2"
                    },
                    {
                      "__typename": "Character",
                      "id": "38"
                    },
                    {
                      "__typename": "Character",
                      "id": "46"
                    },
                    {
                      "__typename": "Character",
                      "id": "63"
                    },
                    {
                      "__typename": "Character",
                      "id": "80"
                    },
                    {
                      "__typename": "Character",
                      "id": "175"
                    },
                    {
                      "__typename": "Character",
                      "id": "221"
                    },
                    {
                      "__typename": "Character",
                      "id": "239"
                    },
                    {
                      "__typename": "Character",
                      "id": "246"
                    },
                    {
                      "__typename": "Character",
                      "id": "304"
                    },
                    {
                      "__typename": "Character",
                      "id": "305"
                    },
                    {
                      "__typename": "Character",
                      "id": "306"
                    },
                    {
                      "__typename": "Character",
                      "id": "329"
                    },
                    {
                      "__typename": "Character",
                      "id": "338"
                    },
                    {
                      "__typename": "Character",
                      "id": "396"
                    },
                    {
                      "__typename": "Character",
                      "id": "397"
                    },
                    {
                      "__typename": "Character",
                      "id": "398"
                    },
                    {
                      "__typename": "Character",
                      "id": "405"
                    }
                  ]
                }
              ],
              "origin": {
                "__typename": "Location",
                "id": "1",
                "name": "Earth (C-137)",
                "dimension": "Dimension C-137",
                "residents": [
                  {
                    "__typename": "Character",
                    "id": "38",
                    "name": "Beth Smith",
                    "image": "https://rickandmortyapi.com/api/character/avatar/38.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "45",
                    "name": "Bill",
                    "image": "https://rickandmortyapi.com/api/character/avatar/45.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "71",
                    "name": "Conroy",
                    "image": "https://rickandmortyapi.com/api/character/avatar/71.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "82",
                    "name": "Cronenberg Rick",
                    "image": "https://rickandmortyapi.com/api/character/avatar/82.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "83",
                    "name": "Cronenberg Morty",
                    "image": "https://rickandmortyapi.com/api/character/avatar/83.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "92",
                    "name": "Davin",
                    "image": "https://rickandmortyapi.com/api/character/avatar/92.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "112",
                    "name": "Eric McMan",
                    "image": "https://rickandmortyapi.com/api/character/avatar/112.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "114",
                    "name": "Ethan",
                    "image": "https://rickandmortyapi.com/api/character/avatar/114.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "116",
                    "name": "Evil Beth Clone",
                    "image": "https://rickandmortyapi.com/api/character/avatar/116.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "117",
                    "name": "Evil Jerry Clone",
                    "image": "https://rickandmortyapi.com/api/character/avatar/117.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "120",
                    "name": "Evil Summer Clone",
                    "image": "https://rickandmortyapi.com/api/character/avatar/120.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "127",
                    "name": "Frank Palicky",
                    "image": "https://rickandmortyapi.com/api/character/avatar/127.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "155",
                    "name": "Harold",
                    "image": "https://rickandmortyapi.com/api/character/avatar/155.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "169",
                    "name": "Jacob",
                    "image": "https://rickandmortyapi.com/api/character/avatar/169.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "175",
                    "name": "Jerry Smith",
                    "image": "https://rickandmortyapi.com/api/character/avatar/175.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "179",
                    "name": "Jessica",
                    "image": "https://rickandmortyapi.com/api/character/avatar/179.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "186",
                    "name": "Joyce Smith",
                    "image": "https://rickandmortyapi.com/api/character/avatar/186.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "201",
                    "name": "Leonard Smith",
                    "image": "https://rickandmortyapi.com/api/character/avatar/201.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "216",
                    "name": "MC Haps",
                    "image": "https://rickandmortyapi.com/api/character/avatar/216.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "239",
                    "name": "Mr. Goldenfold",
                    "image": "https://rickandmortyapi.com/api/character/avatar/239.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "271",
                    "name": "Principal Vagina",
                    "image": "https://rickandmortyapi.com/api/character/avatar/271.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "302",
                    "name": "Ruben",
                    "image": "https://rickandmortyapi.com/api/character/avatar/302.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "303",
                    "name": "Samantha",
                    "image": "https://rickandmortyapi.com/api/character/avatar/303.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "338",
                    "name": "Summer Smith",
                    "image": "https://rickandmortyapi.com/api/character/avatar/338.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "343",
                    "name": "Tammy Guetermann",
                    "image": "https://rickandmortyapi.com/api/character/avatar/343.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "356",
                    "name": "Tom Randolph",
                    "image": "https://rickandmortyapi.com/api/character/avatar/356.jpeg"
                  },
                  {
                    "__typename": "Character",
                    "id": "394",
                    "name": "Davin",
                    "image": "https://rickandmortyapi.com/api/character/avatar/394.jpeg"
                  }
                ]
              }
            },
            {
              "__typename": "Character",
              "id": "2",
              "name": "Morty Smith",
              "status": "Alive",
              "type": "",
              "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
              "episode": [
                {
                  "__typename": "Episode",
                  "id": "1",
                  "name": "Pilot",
                  "characters": [
                    {
                      "__typename": "Character",
                      "id": "1"
                    },
                    {
                      "__typename": "Character",
                      "id": "2"
                    },
                    {
                      "__typename": "Character",
                      "id": "35"
                    },
                    {
                      "__typename": "Character",
                      "id": "38"
                    },
                    {
                      "__typename": "Character",
                      "id": "62"
                    },
                    {
                      "__typename": "Character",
                      "id": "92"
                    },
                    {
                      "__typename": "Character",
                      "id": "127"
                    },
                    {
                      "__typename": "Character",
                      "id": "144"
                    },
                    {
                      "__typename": "Character",
                      "id": "158"
                    },
                    {
                      "__typename": "Character",
                      "id": "175"
                    },
                    {
                      "__typename": "Character",
                      "id": "179"
                    },
                    {
                      "__typename": "Character",
                      "id": "181"
                    },
                    {
                      "__typename": "Character",
                      "id": "239"
                    },
                    {
                      "__typename": "Character",
                      "id": "249"
                    },
                    {
                      "__typename": "Character",
                      "id": "271"
                    },
                    {
                      "__typename": "Character",
                      "id": "338"
                    },
                    {
                      "__typename": "Character",
                      "id": "394"
                    },
                    {
                      "__typename": "Character",
                      "id": "395"
                    },
                    {
                      "__typename": "Character",
                      "id": "435"
                    }
                  ]
                },
                {
                  "__typename": "Episode",
                  "id": "2",
                  "name": "Lawnmower Dog",
                  "characters": [
                    {
                      "__typename": "Character",
                      "id": "1"
                    },
                    {
                      "__typename": "Character",
                      "id": "2"
                    },
                    {
                      "__typename": "Character",
                      "id": "38"
                    },
                    {
                      "__typename": "Character",
                      "id": "46"
                    },
                    {
                      "__typename": "Character",
                      "id": "63"
                    },
                    {
                      "__typename": "Character",
                      "id": "80"
                    },
                    {
                      "__typename": "Character",
                      "id": "175"
                    },
                    {
                      "__typename": "Character",
                      "id": "221"
                    },
                    {
                      "__typename": "Character",
                      "id": "239"
                    },
                    {
                      "__typename": "Character",
                      "id": "246"
                    },
                    {
                      "__typename": "Character",
                      "id": "304"
                    },
                    {
                      "__typename": "Character",
                      "id": "305"
                    },
                    {
                      "__typename": "Character",
                      "id": "306"
                    },
                    {
                      "__typename": "Character",
                      "id": "329"
                    },
                    {
                      "__typename": "Character",
                      "id": "338"
                    },
                    {
                      "__typename": "Character",
                      "id": "396"
                    },
                    {
                      "__typename": "Character",
                      "id": "397"
                    },
                    {
                      "__typename": "Character",
                      "id": "398"
                    },
                    {
                      "__typename": "Character",
                      "id": "405"
                    }
                  ]
                }
              ],
              "origin": {
                "__typename": "Location",
                "id": null,
                "name": "unknown",
                "dimension": null,
                "residents": [

                ]
              }
            }
          ]
        }
      }
    }
    """
}
