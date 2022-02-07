//
//  BookManager.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 01/02/22.
//

import Foundation
protocol BookManagerDelegate{
   func didFailWithError(error: Error)
   func didUpdateBook(_ bookManager: BookManager, bookModel: BookArray)
}

struct BookManager{
   
   let urlBooks = "https://www.googleapis.com/books/v1/volumes?q=HarryPotter&key=AIzaSyA4deYcEJce0HvvE9t09WfMTERNHO_NPak&startIndex=0&maxResults=10&printType=books"
   let defaultImageUrl = "https://ravenspacepublishing.org/wp-content/uploads/2019/04/default-book.jpg"
   var bookModel: BookModel?
   var delegate: BookManagerDelegate?
   
   
   func fetchApi(){
      perfomRequest(urlString: urlBooks)
   }

   
   func perfomRequest(urlString: String){
      if let url = URL(string: urlString) {
         let session = URLSession(configuration: .default)
         let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil{
               self.delegate?.didFailWithError(error: error!)
               return }
            if let safedata = data{
               if let bookSecure = self.parseJson(bookData: safedata) {
                  self.delegate?.didUpdateBook(self, bookModel: bookSecure)
               }
               
            }
         }
         
         task.resume()
         
      }
   }
   
   
   func parseJson(bookData: Data) -> BookArray?{
      let decoder = JSONDecoder()
      var booksArray = BookArray(bookArray: [])
      var  bookObj: BookModel
      do{
         let decodedData = try decoder.decode(BookData.self, from: bookData)
         for i in 0...decodedData.items.count-1{
            
            let title = decodedData.items[i].volumeInfo.title
            let authors = decodedData.items[i].volumeInfo.authors
            let description = decodedData.items[i].volumeInfo.description
            let pageCount = decodedData.items[i].volumeInfo.pageCount
            let categories = decodedData.items[i].volumeInfo.categories
            let averageRating = Double(decodedData.items[i].volumeInfo.averageRating ??  0.0)
            let ratingsCount = Double(decodedData.items[i].volumeInfo.ratingsCount ??  0.0)
            let previewLink = decodedData.items[i].volumeInfo.previewLink
            let infoLink = decodedData.items[i].volumeInfo.infoLink
            let smallThumbnail = decodedData.items[i].volumeInfo.imageLinks?.smallThumbnail
            let thumbnail = decodedData.items[i].volumeInfo.imageLinks?.thumbnail
            let url = URL(string: thumbnail ?? defaultImageUrl)!
            var image = Data()
            if let data = try? Data(contentsOf: url) {
               image = data
            }
            
            bookObj = BookModel(title: title, authors: authors, description: description, pageCount: pageCount, categories: categories, averageRating: averageRating, ratingsCount: ratingsCount, previewLink: previewLink, infoLink: infoLink, smallThumbnail: smallThumbnail ?? "0", thumbnail: thumbnail ?? "1",imageWithData: image)
            booksArray.bookArray.append(bookObj)
            
            
         }
         return booksArray
      }catch{
         print(error)
         self.delegate?.didFailWithError(error: error)
         return nil
      }
      
   }
   
}
