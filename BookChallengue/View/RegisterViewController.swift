import UIKit


class RegisterViewController: UIViewController {
    var headerInit = initializerUI()
    var headerImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInit()
        // Do any additional setup after loading the view.
    }
    
    func uiInit(){
        headerImage = headerInit.uiImageViewSetter("headerimage")
        view.addSubview(headerImage!)
        
    }
    
}
