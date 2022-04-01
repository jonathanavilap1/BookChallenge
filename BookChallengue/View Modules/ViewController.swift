
import UIKit
import SwiftGifOrigin

class ViewController: UIViewController, BookManagerDelegate , HPManagerDelegate{

    
   
//   let splash = SplashScreenView()
   var bookApi = BookManager()
   var bookModelfetch: BookArray?
   var dataSource2: characterArray?
   let loginVC = LoginViewController()
    let LibraryVC = LibraryViewController()
    var hpManager = HPManager()
    let defaults = UserDefaults.standard
    var imageView2 = UIImageView()
    var imageView = UIImageView()
    
    override func viewDidAppear(_ animated: Bool) {
        loginVC.dismiss(animated: true, completion: nil)
        LibraryVC.dismiss(animated: true, completion: nil)
        splashview()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            
            if self.defaults.object(forKey: "loggedin") == nil {
                self.loginVC.modalPresentationStyle = .fullScreen
                self.present(self.loginVC, animated: true, completion: nil)
            } else {
                self.LibraryVC.modalPresentationStyle = .fullScreen
                self.present(self.LibraryVC, animated: true, completion: nil)
            }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       bookApi.delegate = self
       bookApi.fetchApi()
        hpManager.delegatehp = self
        hpManager.fetchApiHP()
        print(self.defaults.object(forKey: "loggedin"))
      

    }
}



// setting delegate actions for UITEXTFIELD
extension ViewController: UITextFieldDelegate {
   
   func splashview() {
       

       
       let splashscreen2 = UIImage.gif(name: "load")
        imageView2 = UIImageView(image: splashscreen2)
       view.addSubview(imageView2)
       imageView2.addAnchorsAndSize(width: 300, height: 200, left: 50, top: 370, right: nil, bottom: nil)

       
       let splashscreen = UIImage.gif(name: "splashScreen")
        imageView = UIImageView(image: splashscreen)
       view.addSubview(imageView)
       imageView.addAnchorsAndSize(width: 190, height: 160, left: 100, top: nil, right: nil, bottom: -80,withAnchor: .bottom, relativeToView: imageView2 )

//      view.addSubview(splash)
//
//      splash.addAnchors(left: -30, top: 180, right: 0, bottom: 0)
   }
    
    func removegif(){
        imageView2.removeFromSuperview()
        imageView.removeFromSuperview()
    }
   
   func didFailWithError(error: Error) {
      print(error)
   }
   
   func didUpdateBook(_ bookManager: BookManager, bookModel: BookArray) {
      DispatchQueue.main.sync {
         
         loginVC.bookModelfetch = bookModel
          LibraryVC.dataSource = bookModel
      
      }
   }
    
    func didFailWithErrorHP(error: Error) {
        print(error)
    }
    
    func didUpdateHP(_ hpManager: HPManager, hpModel: characterArray) {
        DispatchQueue.main.sync {
            loginVC.dataSource2 = hpModel
            LibraryVC.dataSource2 = hpModel
        }
    }

}
