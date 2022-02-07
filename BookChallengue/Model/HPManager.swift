//
//  BookManager.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 01/02/22.
//

import Foundation
protocol HPManagerDelegate{
   func didFailWithErrorHP(error: Error)
   func didUpdateHP(_ bookManager: HPManager, hpModel: HpModel)
}

struct HPManager{

   let urlBooks = "http://hp-api.herokuapp.com/api/characters"
   let defaultImageUrl = "https://ravenspacepublishing.org/wp-content/uploads/2019/04/default-book.jpg"
   var  hpModel: HpModel?
   var delegatehp:HPManagerDelegate?

   
    func fetchApiHP(){
       perfomRequestHP(urlString: urlBooks)
   }
   
   func perfomRequestHP(urlString: String){
      if let url = URL(string: urlString) {
         let session = URLSession(configuration: .default)
         let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil{
               self.delegatehp?.didFailWithErrorHP(error: error!)
               return }
            if let safedata = data{
//               if let dataSecure = self.parseJsonHP(hpData: safedata) {
//                  self.delegate?.didUpdateHP(self, hpModel: dataSecure)
                  print(safedata)
//               }
               
            }
            }
         
         task.resume()
      
   }
}
   
   
   func parseJsonHP(hpData: Data) -> HpModel?{
     let decoder = JSONDecoder()
      let hpmodelsito: HpModel?
     do{
        let decodedData = try decoder.decode(CharacterData.self, from: hpData)
//        for i in 0...decodedData.items.count-1{
           
        print(decodedData)
         hpmodelsito = HpModel(name: "", gender: "", house: "", wizard: true, patronus: "", actor: "", alive: true, image: "")
//           let url = URL(string: thumbnail ?? defaultImageUrl)!
//           var image = Data()
//           if let data = try? Data(contentsOf: url) {
//                    image = data
//               }
           
//        }
      return hpmodelsito
   }catch{
      print(error)
      self.delegatehp?.didFailWithErrorHP(error: error)
      return nil
   }
   
}

}
