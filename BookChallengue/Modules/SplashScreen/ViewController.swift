
import UIKit
import SwiftGifOrigin

class ViewController: UIViewController, BookManagerDelegate{
   
//   let splash = SplashScreenView()
   var bookApi = BookManager()
   var bookModelfetch: BookArray?
   var dataSource2: characterArray?
   let loginVC = LoginViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       splashview()
       bookApi.delegate = self
       bookApi.fetchApi()
       DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
          
          self.loginVC.modalPresentationStyle = .fullScreen
          self.present(self.loginVC, animated: true, completion: nil)
       }

    }
}



// setting delegate actions for UITEXTFIELD
extension ViewController: UITextFieldDelegate {
   
   func splashview() {
       

       
       let splashscreen2 = UIImage.gif(name: "load")
       let imageView2 = UIImageView(image: splashscreen2)
       view.addSubview(imageView2)
       imageView2.addAnchorsAndSize(width: 200, height: 200, left: 90, top: 370, right: nil, bottom: nil)

       
       let splashscreen = UIImage.gif(name: "splashScreen")
       let imageView = UIImageView(image: splashscreen)
       view.addSubview(imageView)
       imageView.addAnchorsAndSize(width: 125, height: 150, left: 130, top: nil, right: nil, bottom: -80,withAnchor: .bottom, relativeToView: imageView2 )

//      view.addSubview(splash)
//
//      splash.addAnchors(left: -30, top: 180, right: 0, bottom: 0)
   }
   
   func didFailWithError(error: Error) {
      print(error)
   }
   
   func didUpdateBook(_ bookManager: BookManager, bookModel: BookArray) {
      DispatchQueue.main.sync {
         
         loginVC.bookModelfetch = bookModel
         
      
      }
   }

}
