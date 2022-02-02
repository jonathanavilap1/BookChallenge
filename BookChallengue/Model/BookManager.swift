//
//  BookManager.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 01/02/22.
//

import Foundation
protocol BookManagerDelegate{
   func didFailWithError(error: Error)
   func didUpdateBook(_ bookManager: BookManager, bookModel: BookModel)
}

struct BookManager{
   let urlBooks = "https://playground-bookstore.herokuapp.com/api/v1/books"
   var bookModel: BookModel?
   var delegate: BookManagerDelegate?
   
   mutating func fetchApi(){
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
            print(safedata)
            if let bookSecure =
                  self.parseJson(bookData: safedata) {
                     self.delegate?.didUpdateBook(self, bookModel: bookSecure)
               print(bookSecure)
            }
                  
                  
         }
      }
      task.resume()
   }
   
}
   
   func parseJson(bookData: Data)-> BookModel?{
      let decoder = JSONDecoder()
      
      do{
         

         let decodedData = try decoder.decode(BookData.self, from: bookData)

         let id = decodedData.data[0].id
         let type = decodedData.data[0].type

         let bookObj = BookModel(type: id, id: type)
         return bookObj
      }catch{
         print(error)
         self.delegate?.didFailWithError(error: error)
         return nil
      }
      
   }

}
