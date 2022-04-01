
import Foundation

// MARK: - BookData
struct BookData: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let volumeInfo: VolumeInfo
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let description: String?
    let pageCount: Int?
    let categories: [String]?
    let averageRating, ratingsCount: Double?
    let imageLinks: ImageLinks?
    let previewLink, infoLink: String?
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}

