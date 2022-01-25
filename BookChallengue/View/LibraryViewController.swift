import UIKit


class LibraryViewController: UIViewController {
    var headerInit = initializerUI()
    var headerImage: UIImageView?
    var backLabel: UIButton?
    var backButton: UIButton?
    var formView: UIView?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var userController = userDB()
    var currentUserLabel: UILabel?
    var currentUser: nuevoUsuario?
    var holaLabel: UILabel?
    var morePopular: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
         currentUser = userController.currentUserGetter()
        uiInit()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    func uiInit(){
        //MARK: Header
        headerImage = headerInit.uiImageViewSetter(uiImageName: "headerimage2")
        view.addSubview(headerImage!)
        headerImage?.addAnchorsAndSize(width: width, height: height/8, left: 0, top: 31, right: 0, bottom: height/0.2)
        
        //MARK: BackButton
        backButton = UIButton()
        backButton?.setImage(UIImage(named: "backButton"), for: .normal)
        view.addSubview(backButton!)
        backButton?.addAnchorsAndSize(width: width/10, height: height/30,left: 7, top: -30, right: nil, bottom: nil, withAnchor: .top, relativeToView: headerImage)
        backButton?.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        //MARK: CurrentUserLabel
        holaLabel = headerInit.uiLabelSetter(labelString: ("Hola"), labelSize: 25, textaligment: .center, isBold: true, isHighLighted: false)
        view.addSubview(holaLabel!)
        holaLabel?.addAnchors(left: nil, top: -45, right: 30, bottom: nil, withAnchor: .top, relativeToView: headerImage)
        
        
        currentUserLabel = headerInit.uiLabelSetter(labelString: (currentUser?.usuario)!, labelSize: 30, textaligment: .center, isBold: true, isHighLighted: true)
        view.addSubview(currentUserLabel!)
        currentUserLabel?.addAnchors(left: nil, top:-5, right: 10, bottom: nil, withAnchor: .top, relativeToView: holaLabel)
        
        
        //MARK: back text button
        backLabel = headerInit.uiButtonSetter(uiButtonNmae: "Back", textAligments: .left, cornerRadius: 0, isBackgroundClear: true, isUnderlined: false)
        view.addSubview(backLabel!)
        backLabel?.addAnchors(left: nil, top: -33, right: nil, bottom: nil, withAnchor: .top, relativeToView: headerImage)
        backLabel?.addAnchors(left: -7, top: nil,      right: nil, bottom: nil, withAnchor: .left, relativeToView: backButton)
        backLabel?.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    
        morePopular = headerInit.uiLabelSetter(labelString: ("Most Popular"), labelSize: 20, textaligment: .center, isBold: true, isHighLighted: false)
        view.addSubview(morePopular!)
        morePopular?.addAnchors(left: width/4, top:45, right: width/4, bottom: nil, withAnchor: .top, relativeToView: headerImage)
    
    }
}

extension LibraryViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    @objc  func dismissView(){
        dismiss(animated: true, completion: nil)
    }
}
    
   
