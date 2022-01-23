import UIKit

class LoginViewController: UIView {
    var headerImage: UIImageView?
    var appIcon: UIImageView?

    init(width: CGFloat, height: CGFloat) {
        headerImage = UIImageView()
        headerImage?.image = UIImage(named: "headerimage")
        headerImage?.addAnchorsAndSize(width: width, height: height/4, left: 0, top: 32, right: 0, bottom: nil)
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
