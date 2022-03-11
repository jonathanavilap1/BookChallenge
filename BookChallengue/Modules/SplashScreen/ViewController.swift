
import UIKit

class ViewController: UIViewController, BookManagerDelegate{
   
   let splash = SplashScreenView()
   var bookApi = BookManager()
   var bookModelfetch: BookArray?
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
      view.addSubview(splash)
      
      splash.addAnchors(left: -30, top: 180, right: 0, bottom: 0)
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
