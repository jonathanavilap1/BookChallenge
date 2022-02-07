

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let name: String?
    let gender: String?
    let house: String?
    let wizard: Bool?
    let patronus: String?
    let hogwartsStudent, hogwartsStaff: Bool?
    let actor: String?
    let alive: Bool?
    let image: String?
}
