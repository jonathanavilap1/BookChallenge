//
//  BookModel.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 01/02/22.
//

import Foundation

struct BookArray{
   var bookArray: [BookModel]
}

struct BookModel{
   let title: String?
   let authors: [String]?
   let description: String?
   let pageCount: Int?
   let categories: [String]?
   let averageRating, ratingsCount: Int?
   let previewLink, infoLink: String?
   let smallThumbnail: String?
   let thumbnail: String?
   let imageWithData: Data?
}
