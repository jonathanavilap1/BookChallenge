//
//  BookData.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 01/02/22.
//

import Foundation

struct BookData: Codable{
   let data:[BookInfo]
}

struct BookInfo: Codable{
   let type: String
   let id: String
//   let attributes: [BookAttributes]
}

//struct BookAttributes: Codable{
//   
//}
