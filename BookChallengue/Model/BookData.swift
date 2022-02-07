////
////  BookData.swift
////  BookChallengue
////
////  Created by Jonathan Avila on 01/02/22.
////
//
//import Foundation
//
//struct BookData: Codable{
//   let BookInfo:[items]
//}
//
//struct items: Codable{
//   let volumeInfo: VolumeInfo
//}
//
//struct VolumeInfo: Codable {
//    let title: String
//    let authors: [String]?
//    let pageCount: Int
//    let categories: [String]?
//    let averageRating, ratingsCount: Int?
//    let imageLinks: ImageLinks?
//    let previewLink, infoLink: String
//}
//
//struct ImageLinks: Codable {
//    let smallThumbnail, thumbnail: String
//}
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

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
    let averageRating, ratingsCount: Int?
    let imageLinks: ImageLinks?
    let previewLink, infoLink: String?
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}

