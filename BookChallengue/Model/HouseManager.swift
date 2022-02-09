////
////  BookManager.swift
////  BookChallengue
////
////  Created by Jonathan Avila on 01/02/22.
////
//
//import Foundation
//protocol HouseManagerDelegate{
//   func didFailWithErrorHouse(error: Error)
//   func didUpdateHPHouse(_ hpManager: HouseManager, hpModel: houseMode)
//}
//struct HouseManager{
//   var  hpModel: HpModel?
//   var delegatehouse:HouseManagerDelegate?
//   var urlApi = "http://hp-api.herokuapp.com/api/characters"
//   let defaultImageUrl = "https://ravenspacepublishing.org/wp-content/uploads/2019/04/default-book.jpg"
//    func fetchApiHP(){
//       perfomRequestHP(urlString: urlApi)
//   }
//   
//   func perfomRequestHP(urlString: String){
//      if let url = URL(string: urlString) {
//         let session = URLSession(configuration: .default)
//         let task = session.dataTask(with: url) { (data, response, error) in
//            if error != nil{
//               self.delegatehouse?.didFailWithErrorHouse(error: error!)
//               return }
//            if let safedata = data{
//               if let dataSecure = self.parseJson(hpDatareceived: safedata) {
//                  self.delegatehouse?.didUpdateHPHouse(self, hpModel: dataSecure)
//
//               }
//               
//            }
//            }
//         
//         task.resume()
//      
//   }
//}
//   func parseJson(hpDatareceived: Data) -> houseMode?{
//      let decoder = JSONDecoder()
//      var hpCharacter: HpModel
//      var hpHouse = houseMode.init(houses: [])
//      do{
//         
//        let decodedData = try decoder.decode([WelcomeElement].self, from: hpDatareceived)
//         for i in 0...50{
//         let name = decodedData[i].name
//         let gender = decodedData[i].gender
//         let house = decodedData[i].house
//         let wizard = decodedData[i].wizard
//         let patronus = decodedData[i].patronus
//         let actor = decodedData[i].actor
//         let alive = decodedData[i].alive
//         let imageUrl = decodedData[i].image ?? defaultImageUrl
//         let url = URL(string: imageUrl) ?? URL(string: defaultImageUrl)
//         var image = Data()
//            if let data = try? Data(contentsOf: url!) {
//               image = data
//               print(data)
//            }
//           
//         
//         hpCharacter = HpModel(name: name, gender: gender, house: house, wizard: wizard, patronus: patronus, actor: actor, alive: alive, image: image)
//            if hpCharacter.house == "Gryffindor"{
//               hpHouse.houses[0].Gryffindor.append(hpCharacter)
//            }else if hpCharacter.house == "Hufflepuff"{
//               hpHouse.houses[0].Hufflepuff.append(hpCharacter)
//            }else if hpCharacter.house == "Ravenclaw"{
//               hpHouse.houses[0].Ravenclaw.append(hpCharacter)
//            }else if hpCharacter.house == "Slytherin"{
//               hpHouse.houses[0].Slytherin.append(hpCharacter)
//            }
//         }
//         return hpHouse
//      }catch{
//         print(error)
//         self.delegatehouse?.didFailWithErrorHouse(error:error)
//         return nil
//      }
//      
//   }
//   
//
//   
//   
//}
