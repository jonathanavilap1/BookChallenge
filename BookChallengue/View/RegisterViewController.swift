import UIKit


class RegisterViewController: UIViewController {
    var headerInit = initializerUI()
    var headerImage: UIImageView?
    var backLabel: UILabel?
    var descriptionLabel: UILabel?
    var formView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        uiInit()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    func uiInit(){
        headerImage = headerInit.uiImageViewSetter("headerimage")
        view.addSubview(headerImage!)
        headerImage?.addAnchorsAndSize(width: width, height: height/5, left: 0, top: 32, right: 0, bottom: height/0.2)

        backLabel = headerInit.uiLabelSetter("< Back", 20, .left,true,isHighLighted: false)
        view.addSubview(backLabel!)
        backLabel?.addAnchors(left: 15, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: headerImage)
        
        descriptionLabel = headerInit.uiLabelSetter("You are few steps away of the best expirence of your life ", 15, .center, false,isHighLighted: false)
        descriptionLabel?.numberOfLines = 0
        view.addSubview(descriptionLabel!)
        descriptionLabel?.addAnchors(left: 10, top: 5, right: 10, bottom: nil, withAnchor: .top, relativeToView: backLabel)
        
        formView = UIView()
        formView?.backgroundColor = .gray
        view.addSubview(formView!)
        formView?.addAnchors(left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: descriptionLabel)
        
        
        
    }
    
}
