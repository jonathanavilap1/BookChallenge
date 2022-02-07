//
//  BookManager.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 01/02/22.
//

import Foundation
protocol HPManagerDelegate{
   func didFailWithErrorHP(error: Error)
   func didUpdateHP(_ hpManager: HPManager, hpModel: characterArray)
}

struct HPManager{

   
   var  hpModel: HpModel?
   var delegatehp:HPManagerDelegate?
   var urlApi = "http://hp-api.herokuapp.com/api/characters"
   var urlApiHouses = "http://hp-api.herokuapp.com/api/characters"
   let defaultImageUrl = "https://ravenspacepublishing.org/wp-content/uploads/2019/04/default-book.jpg"
    func fetchApiHP(){
       perfomRequestHP(urlString: urlApi)
   }
   
   func perfomRequestHP(urlString: String){
      if let url = URL(string: urlString) {
         let session = URLSession(configuration: .default)
         let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil{
               self.delegatehp?.didFailWithErrorHP(error: error!)
               return }
            if let safedata = data{
               if let dataSecure = self.parseJson(hpDatareceived: safedata) {
                  self.delegatehp?.didUpdateHP(self, hpModel: dataSecure)

               }
               
            }
            }
         
         task.resume()
      
   }
}
   func parseJson(hpDatareceived: Data) -> characterArray?{
      let decoder = JSONDecoder()
      print("ahoy")
      var hpArray = characterArray(chArray: [])
      do{
         
        let decodedData = try decoder.decode([WelcomeElement].self, from: hpDatareceived)
         for i in 0...decodedData.count-1{
         let name = decodedData[i].name
         let gender = decodedData[i].gender
         let house = decodedData[i].house
         let wizard = decodedData[i].wizard
         let patronus = decodedData[i].patronus
         let actor = decodedData[i].actor
         let alive = decodedData[i].alive
//         let imageUrl = decodedData[i].image ?? defaultImageUrl
//            let url = URL(string: imageUrl )
//         var image = Data()
//            if let data = try? Data(contentsOf:  url!){
//            image = data
//         }
         
            let hpCharacter = HpModel(name: name, gender: gender, house: house, wizard: wizard, patronus: patronus, actor: actor, alive: alive)
            hpArray.chArray.append(hpCharacter)
         }
         return hpArray
      }catch{
         print(error)
         self.delegatehp?.didFailWithErrorHP(error: error)
         return nil
      }
      
   }
   

   
   
}
