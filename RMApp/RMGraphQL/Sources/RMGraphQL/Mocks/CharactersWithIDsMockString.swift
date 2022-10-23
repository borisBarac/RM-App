//
//  File.swift
//  
//
//  Created by Boris Barac on 23.10.2022.
//

import Foundation


var MOCK_STRING_CHARACTERS_WITH_IDS: String {
    """
    {
      "data": {
        "Characters": [
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
              },
              {
                "__typename": "Episode",
                "id": "3",
                "name": "Anatomy Park",
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
                    "id": "12"
                  },
                  {
                    "__typename": "Character",
                    "id": "17"
                  },
                  {
                    "__typename": "Character",
                    "id": "38"
                  },
                  {
                    "__typename": "Character",
                    "id": "45"
                  },
                  {
                    "__typename": "Character",
                    "id": "96"
                  },
                  {
                    "__typename": "Character",
                    "id": "97"
                  },
                  {
                    "__typename": "Character",
                    "id": "98"
                  },
                  {
                    "__typename": "Character",
                    "id": "99"
                  },
                  {
                    "__typename": "Character",
                    "id": "100"
                  },
                  {
                    "__typename": "Character",
                    "id": "101"
                  },
                  {
                    "__typename": "Character",
                    "id": "108"
                  },
                  {
                    "__typename": "Character",
                    "id": "112"
                  },
                  {
                    "__typename": "Character",
                    "id": "114"
                  },
                  {
                    "__typename": "Character",
                    "id": "169"
                  },
                  {
                    "__typename": "Character",
                    "id": "175"
                  },
                  {
                    "__typename": "Character",
                    "id": "186"
                  },
                  {
                    "__typename": "Character",
                    "id": "201"
                  },
                  {
                    "__typename": "Character",
                    "id": "268"
                  },
                  {
                    "__typename": "Character",
                    "id": "300"
                  },
                  {
                    "__typename": "Character",
                    "id": "302"
                  },
                  {
                    "__typename": "Character",
                    "id": "338"
                  },
                  {
                    "__typename": "Character",
                    "id": "356"
                  }
                ]
              },
              {
                "__typename": "Episode",
                "id": "4",
                "name": "M. Night Shaym-Aliens!",
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
                    "id": "87"
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
                    "id": "191"
                  },
                  {
                    "__typename": "Character",
                    "id": "239"
                  },
                  {
                    "__typename": "Character",
                    "id": "241"
                  },
                  {
                    "__typename": "Character",
                    "id": "270"
                  },
                  {
                    "__typename": "Character",
                    "id": "337"
                  },
                  {
                    "__typename": "Character",
                    "id": "338"
                  }
                ]
              },
              {
                "__typename": "Episode",
                "id": "5",
                "name": "Meeseeks and Destroy",
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
                    "id": "41"
                  },
                  {
                    "__typename": "Character",
                    "id": "89"
                  },
                  {
                    "__typename": "Character",
                    "id": "116"
                  },
                  {
                    "__typename": "Character",
                    "id": "117"
                  },
                  {
                    "__typename": "Character",
                    "id": "120"
                  },
                  {
                    "__typename": "Character",
                    "id": "175"
                  },
                  {
                    "__typename": "Character",
                    "id": "193"
                  },
                  {
                    "__typename": "Character",
                    "id": "238"
                  },
                  {
                    "__typename": "Character",
                    "id": "242"
                  },
                  {
                    "__typename": "Character",
                    "id": "271"
                  },
                  {
                    "__typename": "Character",
                    "id": "303"
                  },
                  {
                    "__typename": "Character",
                    "id": "326"
                  },
                  {
                    "__typename": "Character",
                    "id": "333"
                  },
                  {
                    "__typename": "Character",
                    "id": "338"
                  },
                  {
                    "__typename": "Character",
                    "id": "343"
                  },
                  {
                    "__typename": "Character",
                    "id": "399"
                  },
                  {
                    "__typename": "Character",
                    "id": "400"
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
            "id": "3",
            "name": "Summer Smith",
            "status": "Alive",
            "type": "",
            "image": "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
            "episode": [
              {
                "__typename": "Episode",
                "id": "6",
                "name": "Rick Potion #9",
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
                    "id": "3"
                  },
                  {
                    "__typename": "Character",
                    "id": "4"
                  },
                  {
                    "__typename": "Character",
                    "id": "5"
                  },
                  {
                    "__typename": "Character",
                    "id": "38"
                  },
                  {
                    "__typename": "Character",
                    "id": "58"
                  },
                  {
                    "__typename": "Character",
                    "id": "82"
                  },
                  {
                    "__typename": "Character",
                    "id": "83"
                  },
                  {
                    "__typename": "Character",
                    "id": "92"
                  },
                  {
                    "__typename": "Character",
                    "id": "155"
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
                    "id": "216"
                  },
                  {
                    "__typename": "Character",
                    "id": "234"
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
                    "id": "251"
                  },
                  {
                    "__typename": "Character",
                    "id": "271"
                  },
                  {
                    "__typename": "Character",
                    "id": "293"
                  },
                  {
                    "__typename": "Character",
                    "id": "338"
                  },
                  {
                    "__typename": "Character",
                    "id": "343"
                  },
                  {
                    "__typename": "Character",
                    "id": "394"
                  }
                ]
              },
              {
                "__typename": "Episode",
                "id": "7",
                "name": "Raising Gazorpazorp",
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
                    "id": "3"
                  },
                  {
                    "__typename": "Character",
                    "id": "4"
                  },
                  {
                    "__typename": "Character",
                    "id": "5"
                  },
                  {
                    "__typename": "Character",
                    "id": "59"
                  },
                  {
                    "__typename": "Character",
                    "id": "151"
                  },
                  {
                    "__typename": "Character",
                    "id": "168"
                  },
                  {
                    "__typename": "Character",
                    "id": "211"
                  },
                  {
                    "__typename": "Character",
                    "id": "230"
                  },
                  {
                    "__typename": "Character",
                    "id": "258"
                  },
                  {
                    "__typename": "Character",
                    "id": "329"
                  },
                  {
                    "__typename": "Character",
                    "id": "376"
                  },
                  {
                    "__typename": "Character",
                    "id": "401"
                  }
                ]
              }
            ],
            "origin": {
              "__typename": "Location",
              "id": "20",
              "name": "Earth (Replacement Dimension)",
              "dimension": "Replacement Dimension",
              "residents": [
                {
                  "__typename": "Character",
                  "id": "3",
                  "name": "Summer Smith",
                  "image": "https://rickandmortyapi.com/api/character/avatar/3.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "4",
                  "name": "Beth Smith",
                  "image": "https://rickandmortyapi.com/api/character/avatar/4.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "5",
                  "name": "Jerry Smith",
                  "image": "https://rickandmortyapi.com/api/character/avatar/5.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "9",
                  "name": "Agency Director",
                  "image": "https://rickandmortyapi.com/api/character/avatar/9.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "11",
                  "name": "Albert Einstein",
                  "image": "https://rickandmortyapi.com/api/character/avatar/11.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "13",
                  "name": "Alien Googah",
                  "image": "https://rickandmortyapi.com/api/character/avatar/13.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "16",
                  "name": "Amish Cyborg",
                  "image": "https://rickandmortyapi.com/api/character/avatar/16.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "31",
                  "name": "Baby Wizard",
                  "image": "https://rickandmortyapi.com/api/character/avatar/31.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "32",
                  "name": "Bearded Lady",
                  "image": "https://rickandmortyapi.com/api/character/avatar/32.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "50",
                  "name": "Blim Blam",
                  "image": "https://rickandmortyapi.com/api/character/avatar/50.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "58",
                  "name": "Brad",
                  "image": "https://rickandmortyapi.com/api/character/avatar/58.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "59",
                  "name": "Brad Anderson",
                  "image": "https://rickandmortyapi.com/api/character/avatar/59.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "64",
                  "name": "Chris",
                  "image": "https://rickandmortyapi.com/api/character/avatar/64.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "66",
                  "name": "Coach Feratu (Balik Alistane)",
                  "image": "https://rickandmortyapi.com/api/character/avatar/66.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "76",
                  "name": "Cousin Nicky",
                  "image": "https://rickandmortyapi.com/api/character/avatar/76.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "88",
                  "name": "Cynthia",
                  "image": "https://rickandmortyapi.com/api/character/avatar/88.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "103",
                  "name": "Doofus Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/103.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "107",
                  "name": "Dr. Wong",
                  "image": "https://rickandmortyapi.com/api/character/avatar/107.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "109",
                  "name": "Duck With Muscles",
                  "image": "https://rickandmortyapi.com/api/character/avatar/109.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "113",
                  "name": "Eric Stoltz Mask Morty",
                  "image": "https://rickandmortyapi.com/api/character/avatar/113.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "115",
                  "name": "Ethan",
                  "image": "https://rickandmortyapi.com/api/character/avatar/115.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "124",
                  "name": "Father Bob",
                  "image": "https://rickandmortyapi.com/api/character/avatar/124.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "128",
                  "name": "Frankenstein's Monster",
                  "image": "https://rickandmortyapi.com/api/character/avatar/128.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "137",
                  "name": "Gene",
                  "image": "https://rickandmortyapi.com/api/character/avatar/137.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "138",
                  "name": "General Nathan",
                  "image": "https://rickandmortyapi.com/api/character/avatar/138.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "141",
                  "name": "Ghost in a Jar",
                  "image": "https://rickandmortyapi.com/api/character/avatar/141.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "147",
                  "name": "Gobo",
                  "image": "https://rickandmortyapi.com/api/character/avatar/147.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "149",
                  "name": "Gordon Lunas",
                  "image": "https://rickandmortyapi.com/api/character/avatar/149.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "151",
                  "name": "Gwendolyn",
                  "image": "https://rickandmortyapi.com/api/character/avatar/151.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "154",
                  "name": "Hamurai",
                  "image": "https://rickandmortyapi.com/api/character/avatar/154.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "166",
                  "name": "Invisi-trooper",
                  "image": "https://rickandmortyapi.com/api/character/avatar/166.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "167",
                  "name": "Izzy",
                  "image": "https://rickandmortyapi.com/api/character/avatar/167.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "170",
                  "name": "Jacqueline",
                  "image": "https://rickandmortyapi.com/api/character/avatar/170.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "171",
                  "name": "Jaguar",
                  "image": "https://rickandmortyapi.com/api/character/avatar/171.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "172",
                  "name": "Jamey",
                  "image": "https://rickandmortyapi.com/api/character/avatar/172.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "180",
                  "name": "Jessica",
                  "image": "https://rickandmortyapi.com/api/character/avatar/180.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "181",
                  "name": "Jessica's Friend",
                  "image": "https://rickandmortyapi.com/api/character/avatar/181.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "182",
                  "name": "Jim",
                  "image": "https://rickandmortyapi.com/api/character/avatar/182.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "185",
                  "name": "Joseph Eli Lipkip",
                  "image": "https://rickandmortyapi.com/api/character/avatar/185.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "189",
                  "name": "Katarina",
                  "image": "https://rickandmortyapi.com/api/character/avatar/189.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "190",
                  "name": "Keara",
                  "image": "https://rickandmortyapi.com/api/character/avatar/190.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "203",
                  "name": "Lil B",
                  "image": "https://rickandmortyapi.com/api/character/avatar/203.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "210",
                  "name": "Lucy",
                  "image": "https://rickandmortyapi.com/api/character/avatar/210.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "217",
                  "name": "Mechanical Morty",
                  "image": "https://rickandmortyapi.com/api/character/avatar/217.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "218",
                  "name": "Mechanical Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/218.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "219",
                  "name": "Mechanical Summer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/219.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "227",
                  "name": "Mitch",
                  "image": "https://rickandmortyapi.com/api/character/avatar/227.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "230",
                  "name": "Morty Jr.",
                  "image": "https://rickandmortyapi.com/api/character/avatar/230.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "233",
                  "name": "Morty K-22",
                  "image": "https://rickandmortyapi.com/api/character/avatar/233.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "234",
                  "name": "Morty Smith",
                  "image": "https://rickandmortyapi.com/api/character/avatar/234.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "236",
                  "name": "Mr. Beauregard",
                  "image": "https://rickandmortyapi.com/api/character/avatar/236.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "237",
                  "name": "Mr. Benson",
                  "image": "https://rickandmortyapi.com/api/character/avatar/237.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "240",
                  "name": "Mr. Goldenfold",
                  "image": "https://rickandmortyapi.com/api/character/avatar/240.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "241",
                  "name": "Mr. Marklovitz",
                  "image": "https://rickandmortyapi.com/api/character/avatar/241.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "243",
                  "name": "Mr. Needful",
                  "image": "https://rickandmortyapi.com/api/character/avatar/243.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "244",
                  "name": "Mr. Poopybutthole",
                  "image": "https://rickandmortyapi.com/api/character/avatar/244.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "245",
                  "name": "Mrs. Lipkip",
                  "image": "https://rickandmortyapi.com/api/character/avatar/245.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "248",
                  "name": "Mrs. Refrigerator",
                  "image": "https://rickandmortyapi.com/api/character/avatar/248.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "251",
                  "name": "Nancy",
                  "image": "https://rickandmortyapi.com/api/character/avatar/251.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "255",
                  "name": "Orthodox Jew",
                  "image": "https://rickandmortyapi.com/api/character/avatar/255.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "259",
                  "name": "Pencilvester",
                  "image": "https://rickandmortyapi.com/api/character/avatar/259.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "262",
                  "name": "Photography Raptor",
                  "image": "https://rickandmortyapi.com/api/character/avatar/262.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "265",
                  "name": "Pickle Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/265.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "272",
                  "name": "Principal Vagina",
                  "image": "https://rickandmortyapi.com/api/character/avatar/272.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "276",
                  "name": "Rat Boss",
                  "image": "https://rickandmortyapi.com/api/character/avatar/276.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "280",
                  "name": "Reverse Giraffe",
                  "image": "https://rickandmortyapi.com/api/character/avatar/280.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "292",
                  "name": "Rick K-22",
                  "image": "https://rickandmortyapi.com/api/character/avatar/292.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "293",
                  "name": "Rick Sanchez",
                  "image": "https://rickandmortyapi.com/api/character/avatar/293.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "324",
                  "name": "Sleepy Gary",
                  "image": "https://rickandmortyapi.com/api/character/avatar/324.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "326",
                  "name": "Slippery Stair",
                  "image": "https://rickandmortyapi.com/api/character/avatar/326.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "327",
                  "name": "Slow Mobius",
                  "image": "https://rickandmortyapi.com/api/character/avatar/327.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "332",
                  "name": "Stacy",
                  "image": "https://rickandmortyapi.com/api/character/avatar/332.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "335",
                  "name": "Steve",
                  "image": "https://rickandmortyapi.com/api/character/avatar/335.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "341",
                  "name": "Taddy Mason",
                  "image": "https://rickandmortyapi.com/api/character/avatar/341.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "346",
                  "name": "Terry",
                  "image": "https://rickandmortyapi.com/api/character/avatar/346.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "347",
                  "name": "President Curtis",
                  "image": "https://rickandmortyapi.com/api/character/avatar/347.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "352",
                  "name": "Tinkles",
                  "image": "https://rickandmortyapi.com/api/character/avatar/352.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "353",
                  "name": "Tiny Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/353.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "354",
                  "name": "Toby Matthews",
                  "image": "https://rickandmortyapi.com/api/character/avatar/354.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "357",
                  "name": "Tommy's Clone",
                  "image": "https://rickandmortyapi.com/api/character/avatar/357.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "360",
                  "name": "Toxic Morty",
                  "image": "https://rickandmortyapi.com/api/character/avatar/360.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "361",
                  "name": "Toxic Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/361.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "363",
                  "name": "Trandor",
                  "image": "https://rickandmortyapi.com/api/character/avatar/363.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "365",
                  "name": "Tricia Lange",
                  "image": "https://rickandmortyapi.com/api/character/avatar/365.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "374",
                  "name": "Vampire Master",
                  "image": "https://rickandmortyapi.com/api/character/avatar/374.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "377",
                  "name": "Voltematron",
                  "image": "https://rickandmortyapi.com/api/character/avatar/377.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "390",
                  "name": "Zick Zack",
                  "image": "https://rickandmortyapi.com/api/character/avatar/390.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "391",
                  "name": "Uncle Steve",
                  "image": "https://rickandmortyapi.com/api/character/avatar/391.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "401",
                  "name": "Morty Jr's interviewer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/401.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "402",
                  "name": "Guy from The Bachelor",
                  "image": "https://rickandmortyapi.com/api/character/avatar/402.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "405",
                  "name": "Trunkphobic suspenders guy",
                  "image": "https://rickandmortyapi.com/api/character/avatar/405.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "423",
                  "name": "Synthetic Laser Eels",
                  "image": "https://rickandmortyapi.com/api/character/avatar/423.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "435",
                  "name": "Pripudlian",
                  "image": "https://rickandmortyapi.com/api/character/avatar/435.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "437",
                  "name": "Michael",
                  "image": "https://rickandmortyapi.com/api/character/avatar/437.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "438",
                  "name": "Michael's Lawyer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/438.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "439",
                  "name": "Veterinary",
                  "image": "https://rickandmortyapi.com/api/character/avatar/439.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "440",
                  "name": "Veterinary Nurse",
                  "image": "https://rickandmortyapi.com/api/character/avatar/440.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "452",
                  "name": "Simon",
                  "image": "https://rickandmortyapi.com/api/character/avatar/452.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "453",
                  "name": "Vampire Master's Assistant",
                  "image": "https://rickandmortyapi.com/api/character/avatar/453.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "467",
                  "name": "Morphizer-XE Customer Support",
                  "image": "https://rickandmortyapi.com/api/character/avatar/467.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "468",
                  "name": "Morphizer-XE Customer Support",
                  "image": "https://rickandmortyapi.com/api/character/avatar/468.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "469",
                  "name": "Morphizer-XE Customer Support",
                  "image": "https://rickandmortyapi.com/api/character/avatar/469.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "471",
                  "name": "Little Voltron",
                  "image": "https://rickandmortyapi.com/api/character/avatar/471.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "492",
                  "name": "Varrix",
                  "image": "https://rickandmortyapi.com/api/character/avatar/492.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "493",
                  "name": "Secretary of the Interior",
                  "image": "https://rickandmortyapi.com/api/character/avatar/493.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "497",
                  "name": "Hologram Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/497.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "509",
                  "name": "Bully",
                  "image": "https://rickandmortyapi.com/api/character/avatar/509.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "510",
                  "name": "Anchorman",
                  "image": "https://rickandmortyapi.com/api/character/avatar/510.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "511",
                  "name": "Anchorwoman",
                  "image": "https://rickandmortyapi.com/api/character/avatar/511.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "512",
                  "name": "Morty’s Lawyer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/512.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "513",
                  "name": "Judge",
                  "image": "https://rickandmortyapi.com/api/character/avatar/513.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "514",
                  "name": "Public Opinion Judge",
                  "image": "https://rickandmortyapi.com/api/character/avatar/514.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "516",
                  "name": "Wasp Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/516.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "517",
                  "name": "Wasp Rick’s Clone",
                  "image": "https://rickandmortyapi.com/api/character/avatar/517.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "523",
                  "name": "Boglin",
                  "image": "https://rickandmortyapi.com/api/character/avatar/523.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "524",
                  "name": "Kirkland Brand Mr. Meeseeks",
                  "image": "https://rickandmortyapi.com/api/character/avatar/524.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "526",
                  "name": "Danny Publitz",
                  "image": "https://rickandmortyapi.com/api/character/avatar/526.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "534",
                  "name": "Tony's Dad",
                  "image": "https://rickandmortyapi.com/api/character/avatar/534.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "535",
                  "name": "Jeff",
                  "image": "https://rickandmortyapi.com/api/character/avatar/535.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "536",
                  "name": "Josiah",
                  "image": "https://rickandmortyapi.com/api/character/avatar/536.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "537",
                  "name": "Maggie",
                  "image": "https://rickandmortyapi.com/api/character/avatar/537.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "538",
                  "name": "Priest Witherspoon",
                  "image": "https://rickandmortyapi.com/api/character/avatar/538.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "539",
                  "name": "Richard",
                  "image": "https://rickandmortyapi.com/api/character/avatar/539.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "540",
                  "name": "Running Bird",
                  "image": "https://rickandmortyapi.com/api/character/avatar/540.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "541",
                  "name": "Secretary at Tony's",
                  "image": "https://rickandmortyapi.com/api/character/avatar/541.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "561",
                  "name": "Netflix Executive",
                  "image": "https://rickandmortyapi.com/api/character/avatar/561.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "562",
                  "name": "Balthromaw",
                  "image": "https://rickandmortyapi.com/api/character/avatar/562.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "564",
                  "name": "Talking Cat",
                  "image": "https://rickandmortyapi.com/api/character/avatar/564.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "570",
                  "name": "Chachi",
                  "image": "https://rickandmortyapi.com/api/character/avatar/570.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "575",
                  "name": "Snake Resistance Robot",
                  "image": "https://rickandmortyapi.com/api/character/avatar/575.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "584",
                  "name": "Bar Customer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/584.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "585",
                  "name": "Bartender",
                  "image": "https://rickandmortyapi.com/api/character/avatar/585.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "586",
                  "name": "PC Basketball Player",
                  "image": "https://rickandmortyapi.com/api/character/avatar/586.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "588",
                  "name": "Pet Shop Employee",
                  "image": "https://rickandmortyapi.com/api/character/avatar/588.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "590",
                  "name": "High Pilot",
                  "image": "https://rickandmortyapi.com/api/character/avatar/590.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "591",
                  "name": "High Pilot",
                  "image": "https://rickandmortyapi.com/api/character/avatar/591.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "592",
                  "name": "Phoenixperson",
                  "image": "https://rickandmortyapi.com/api/character/avatar/592.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "667",
                  "name": "Defiance Beth",
                  "image": "https://rickandmortyapi.com/api/character/avatar/667.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "672",
                  "name": "Mr. Nimbus",
                  "image": "https://rickandmortyapi.com/api/character/avatar/672.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "680",
                  "name": "Adam",
                  "image": "https://rickandmortyapi.com/api/character/avatar/680.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "684",
                  "name": "Mr. Nimbus Secretary",
                  "image": "https://rickandmortyapi.com/api/character/avatar/684.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "686",
                  "name": "Mr. Nimbus' Squid",
                  "image": "https://rickandmortyapi.com/api/character/avatar/686.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "687",
                  "name": "Scarecrow Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/687.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "688",
                  "name": "Scarecrow Summer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/688.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "689",
                  "name": "Scarecrow Jerry",
                  "image": "https://rickandmortyapi.com/api/character/avatar/689.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "690",
                  "name": "Scarecrow Morty",
                  "image": "https://rickandmortyapi.com/api/character/avatar/690.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "691",
                  "name": "Scarecrow Beth",
                  "image": "https://rickandmortyapi.com/api/character/avatar/691.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "692",
                  "name": "Glockenspiel Jerry",
                  "image": "https://rickandmortyapi.com/api/character/avatar/692.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "693",
                  "name": "Glockenspiel Beth",
                  "image": "https://rickandmortyapi.com/api/character/avatar/693.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "694",
                  "name": "Glockenspiel Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/694.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "695",
                  "name": "Glockenspiel Summer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/695.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "696",
                  "name": "Glockenspiel Morty",
                  "image": "https://rickandmortyapi.com/api/character/avatar/696.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "697",
                  "name": "Wicker Beth",
                  "image": "https://rickandmortyapi.com/api/character/avatar/697.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "698",
                  "name": "Wicker Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/698.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "699",
                  "name": "Wicker Morty",
                  "image": "https://rickandmortyapi.com/api/character/avatar/699.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "700",
                  "name": "Wicker Summer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/700.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "701",
                  "name": "Metal Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/701.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "702",
                  "name": "Gun Brain Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/702.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "703",
                  "name": "Mr. Always Wants to be Hunted",
                  "image": "https://rickandmortyapi.com/api/character/avatar/703.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "704",
                  "name": "Squid Costume Beth",
                  "image": "https://rickandmortyapi.com/api/character/avatar/704.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "705",
                  "name": "Squid Costume Jerry",
                  "image": "https://rickandmortyapi.com/api/character/avatar/705.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "706",
                  "name": "Squid Costume Morty",
                  "image": "https://rickandmortyapi.com/api/character/avatar/706.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "707",
                  "name": "Squid Costume Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/707.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "708",
                  "name": "Squid Costume Summer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/708.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "710",
                  "name": "Steve",
                  "image": "https://rickandmortyapi.com/api/character/avatar/710.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "712",
                  "name": "Too Cute to Murder Beth",
                  "image": "https://rickandmortyapi.com/api/character/avatar/712.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "713",
                  "name": "Too Cute to Murder Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/713.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "714",
                  "name": "Too Cute to Murder Jerry",
                  "image": "https://rickandmortyapi.com/api/character/avatar/714.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "715",
                  "name": "Too Cute to Murder Morty",
                  "image": "https://rickandmortyapi.com/api/character/avatar/715.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "716",
                  "name": "Too Cute to Murder Summer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/716.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "717",
                  "name": "Planetina",
                  "image": "https://rickandmortyapi.com/api/character/avatar/717.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "719",
                  "name": "Diesel Weasel",
                  "image": "https://rickandmortyapi.com/api/character/avatar/719.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "720",
                  "name": "Eddie",
                  "image": "https://rickandmortyapi.com/api/character/avatar/720.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "721",
                  "name": "Xing Ho",
                  "image": "https://rickandmortyapi.com/api/character/avatar/721.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "722",
                  "name": "Air Tina-Teer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/722.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "723",
                  "name": "Water Tina-Teer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/723.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "724",
                  "name": "Planetina Buyer",
                  "image": "https://rickandmortyapi.com/api/character/avatar/724.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "725",
                  "name": "Tony Galopagus",
                  "image": "https://rickandmortyapi.com/api/character/avatar/725.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "726",
                  "name": "Sticky",
                  "image": "https://rickandmortyapi.com/api/character/avatar/726.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "727",
                  "name": "Professor Shabooboo",
                  "image": "https://rickandmortyapi.com/api/character/avatar/727.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "728",
                  "name": "Sperm Queen",
                  "image": "https://rickandmortyapi.com/api/character/avatar/728.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "729",
                  "name": "CHUD King",
                  "image": "https://rickandmortyapi.com/api/character/avatar/729.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "730",
                  "name": "Princess Ponietta",
                  "image": "https://rickandmortyapi.com/api/character/avatar/730.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "732",
                  "name": "Blazen",
                  "image": "https://rickandmortyapi.com/api/character/avatar/732.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "733",
                  "name": "Kathy Ireland",
                  "image": "https://rickandmortyapi.com/api/character/avatar/733.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "734",
                  "name": "Amazing Johnathan",
                  "image": "https://rickandmortyapi.com/api/character/avatar/734.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "735",
                  "name": "Foal Sanchez",
                  "image": "https://rickandmortyapi.com/api/character/avatar/735.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "737",
                  "name": "Cirque du Soleil Zumanity Member",
                  "image": "https://rickandmortyapi.com/api/character/avatar/737.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "738",
                  "name": "Cirque du Soleil Zumanity Member",
                  "image": "https://rickandmortyapi.com/api/character/avatar/738.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "739",
                  "name": "Cirque du Soleil Zumanity Member",
                  "image": "https://rickandmortyapi.com/api/character/avatar/739.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "740",
                  "name": "Cirque du Soleil Zumanity Member",
                  "image": "https://rickandmortyapi.com/api/character/avatar/740.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "741",
                  "name": "Cirque du Soleil Zumanity Member",
                  "image": "https://rickandmortyapi.com/api/character/avatar/741.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "742",
                  "name": "Bruce Chutback",
                  "image": "https://rickandmortyapi.com/api/character/avatar/742.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "753",
                  "name": "Space Cruiser",
                  "image": "https://rickandmortyapi.com/api/character/avatar/753.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "754",
                  "name": "Coop",
                  "image": "https://rickandmortyapi.com/api/character/avatar/754.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "755",
                  "name": "Dwayne",
                  "image": "https://rickandmortyapi.com/api/character/avatar/755.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "756",
                  "name": "Franklin D. Roosevelt",
                  "image": "https://rickandmortyapi.com/api/character/avatar/756.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "757",
                  "name": "President's General",
                  "image": "https://rickandmortyapi.com/api/character/avatar/757.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "758",
                  "name": "Giant Assassin Hidden in the Statue of Liberty",
                  "image": "https://rickandmortyapi.com/api/character/avatar/758.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "759",
                  "name": "Turkey Morty",
                  "image": "https://rickandmortyapi.com/api/character/avatar/759.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "760",
                  "name": "Turkey Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/760.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "761",
                  "name": "Turkey President Curtis",
                  "image": "https://rickandmortyapi.com/api/character/avatar/761.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "762",
                  "name": "Martínez",
                  "image": "https://rickandmortyapi.com/api/character/avatar/762.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "763",
                  "name": "Marvin",
                  "image": "https://rickandmortyapi.com/api/character/avatar/763.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "764",
                  "name": "Jackey",
                  "image": "https://rickandmortyapi.com/api/character/avatar/764.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "765",
                  "name": "Native Alien",
                  "image": "https://rickandmortyapi.com/api/character/avatar/765.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "766",
                  "name": "Pilgrim Alien",
                  "image": "https://rickandmortyapi.com/api/character/avatar/766.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "767",
                  "name": "President Turkey",
                  "image": "https://rickandmortyapi.com/api/character/avatar/767.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "768",
                  "name": "Mary-Lou",
                  "image": "https://rickandmortyapi.com/api/character/avatar/768.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "769",
                  "name": "Big Fat rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/769.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "770",
                  "name": "Hothead Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/770.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "771",
                  "name": "Ricardo Montoya",
                  "image": "https://rickandmortyapi.com/api/character/avatar/771.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "772",
                  "name": "Wrap-it-up Little Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/772.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "773",
                  "name": "Yo-yo Rick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/773.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "774",
                  "name": "Voiceoverian",
                  "image": "https://rickandmortyapi.com/api/character/avatar/774.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "775",
                  "name": "Voiceoverian",
                  "image": "https://rickandmortyapi.com/api/character/avatar/775.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "776",
                  "name": "Gotron Pilot",
                  "image": "https://rickandmortyapi.com/api/character/avatar/776.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "777",
                  "name": "Gotron Pilot",
                  "image": "https://rickandmortyapi.com/api/character/avatar/777.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "778",
                  "name": "Gotron Pilot",
                  "image": "https://rickandmortyapi.com/api/character/avatar/778.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "781",
                  "name": "Rick's Garage",
                  "image": "https://rickandmortyapi.com/api/character/avatar/781.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "786",
                  "name": "Birdperson & Tammy's Child",
                  "image": "https://rickandmortyapi.com/api/character/avatar/786.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "788",
                  "name": "Mr. Cookie President",
                  "image": "https://rickandmortyapi.com/api/character/avatar/788.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "789",
                  "name": "Nick",
                  "image": "https://rickandmortyapi.com/api/character/avatar/789.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "790",
                  "name": "Harold (Garbage Goober)",
                  "image": "https://rickandmortyapi.com/api/character/avatar/790.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "791",
                  "name": "Harold's Wife",
                  "image": "https://rickandmortyapi.com/api/character/avatar/791.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "794",
                  "name": "Samansky",
                  "image": "https://rickandmortyapi.com/api/character/avatar/794.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "800",
                  "name": "Super Turkey",
                  "image": "https://rickandmortyapi.com/api/character/avatar/800.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "813",
                  "name": "Crow Horse",
                  "image": "https://rickandmortyapi.com/api/character/avatar/813.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "821",
                  "name": "Gotron",
                  "image": "https://rickandmortyapi.com/api/character/avatar/821.jpeg"
                },
                {
                  "__typename": "Character",
                  "id": "826",
                  "name": "Butter Robot",
                  "image": "https://rickandmortyapi.com/api/character/avatar/826.jpeg"
                }
              ]
            }
          }
        ]
      }
    }
"""
}
