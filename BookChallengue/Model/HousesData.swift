
import Foundation

// MARK: - Element
struct Element: Codable {
    let name: String
    let wizard: Bool
    let patronus: Patronus
    let hogwartsStudent, hogwartsStaff: Bool
    let actor: String
    let alive: Bool
    let image: String

enum Species: String, Codable {
    case ghost = "ghost"
    case human = "human"
}

// MARK: - Wand
struct Wand: Codable {
    let wood: Wood
    let core: Core
    let length: Length
}

enum Core: String, Codable {
    case empty = ""
    case unicornHair = "unicorn hair"
}

enum Length: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Length.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Length"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum Wood: String, Codable {
    case ash = "ash"
    case empty = ""
}

enum YearOfBirth: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(YearOfBirth.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for YearOfBirth"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

typealias Welcome = [WelcomeElement]
