//
//  CharactersModel.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 06/02/22.
//

import Foundation


import Foundation

// MARK: - HPELEMENT
struct CharacterData: Codable {
    let name: String
    let gender: Gender
    let house: House
    let wizard: Bool
    let patronus: Patronus
    let actor: String
    let alive: Bool
    let image: String
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

enum House: String, Codable {
    case empty = ""
    case gryffindor = "Gryffindor"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
}

enum Patronus: String, Codable {
    case boar = "boar"
    case doe = "doe"
    case empty = ""
    case goat = "goat"
    case hare = "hare"
    case horse = "horse"
    case jackRussellTerrier = "Jack Russell terrier"
    case lynx = "lynx"
    case otter = "otter"
    case persianCat = "persian cat"
    case stag = "stag"
    case swan = "swan"
    case tabbyCat = "tabby cat"
    case weasel = "weasel"
    case wolf = "wolf"
}



