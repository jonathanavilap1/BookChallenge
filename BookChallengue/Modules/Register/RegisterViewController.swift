import UIKit
import Firebase


class RegisterViewController: UIViewController {
   var headerInit = initializerUI()
   var headerImage: UIImageView?
   var backLabel: UIButton?
   var descriptionLabel: UILabel?
   var formView: UIView?
   var backButton: UIButton?
   var singInButton: UIButton?
   var userTextField: UITextField?
   var emailTextField: UITextField?
   var passwordTextField: UITextField?
   var passwordTextField2: UITextField?
   var confirmPasswordTextField: UITextField?
   var emailTextFieldImage: UIImageView?
   var passwordTextFieldImage: UIImageView?
   var passwordTextFieldImage2: UIImageView?
   var userTextFieldImage: UIImageView?
   var width = UIScreen.main.bounds.width
   var height = UIScreen.main.bounds.height
   let dataBase = Firestore.firestore()
 
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // dismiss view
      let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
      view.addGestureRecognizer(tap)
      // initialize main view
      uiInit()
      view.backgroundColor = .white
      // Do any additional setup after loading the view.
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle {
      return .darkContent
   }
   
   func uiInit(){
      //MARK: Dismiss keyboard when touch anywhere on screen
      
      //MARK: Header
      headerImage = headerInit.uiImageViewSetter(uiImageName: "headerimage")
      view.addSubview(headerImage!)
      headerImage?.addAnchorsAndSize(width: width, height: height/6, left: 5, top: 35, right: 5, bottom: nil)
      
      //MARK: BackButton
      backButton = UIButton()
      backButton?.setImage(UIImage(named: "backButton"), for: .normal)
      view.addSubview(backButton!)
      backButton?.addAnchorsAndSize(width: width/10, height: height/30,left: 7, top: -130, right: nil, bottom: nil, withAnchor: .top, relativeToView: headerImage)
      backButton?.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
      
      
      //MARK: back text button
      backLabel = headerInit.uiButtonSetter(uiButtonNmae: "Back", textAligments: .left, cornerRadius: 0, isBackgroundClear: true, isUnderlined: false)
      view.addSubview(backLabel!)
      backLabel?.addAnchors(left: nil, top: -133, right: nil, bottom: nil, withAnchor: .top, relativeToView: headerImage)
      backLabel?.addAnchors(left: -7, top: nil,      right: nil, bottom: nil, withAnchor: .left, relativeToView: backButton)
      backLabel?.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
      
      
      //MARK: DescriptionLabel
      descriptionLabel = headerInit.uiLabelSetter(labelString: "You are few steps away of the best expirence of your life ", labelSize: 15, textaligment: .center, isBold: false,isHighLighted: false)
      descriptionLabel?.numberOfLines = 0
      view.addSubview(descriptionLabel!)
      descriptionLabel?.addAnchors(left: 10, top: 125, right: 10, bottom: nil, withAnchor: .top, relativeToView: backLabel)
      
      //MARK: view for form
      formView = headerInit.uiViewSetter()
      view.addSubview(formView!)
      formView?.addAnchorsAndSize(width: width-40, height: height/2, left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: descriptionLabel)
      
      
      // MARK: form Buttons
      
      //user textfield
      userTextFieldImage = headerInit.uiImageViewSetter(uiImageName: "emailimage")
      formView?.addSubview(userTextFieldImage!)
      userTextFieldImage?.addAnchors(left: width/14, top: 30, right: width/14, bottom: nil)
      
      userTextField = headerInit.textFieldSetter(isClear: true, placeHolderString: "Jonathan Avila",isSecure: false)
      formView?.addSubview(userTextField!)
      userTextField?.addAnchors(left: 110, top: 53, right: width/14, bottom: nil)
      userTextField!.delegate = self
      
      // Email textfield
      emailTextFieldImage = headerInit.uiImageViewSetter(uiImageName: "userimage")
      formView?.addSubview(emailTextFieldImage!)
      emailTextFieldImage?.addAnchors(left: width/14, top: 20, right: width/14, bottom: nil, withAnchor: .top, relativeToView: userTextFieldImage)
      
      emailTextField = headerInit.textFieldSetter(isClear: true, placeHolderString: "example@gmail.com",isSecure: false)
      formView?.addSubview(emailTextField!)
      emailTextField?.addAnchors(left: 110, top: 43, right: width/14, bottom: nil, withAnchor: .top, relativeToView: userTextFieldImage)
      emailTextField!.delegate = self
      
      // MARK: password Buttons
      passwordTextFieldImage = headerInit.uiImageViewSetter(uiImageName: "passwordimage")
      formView?.addSubview(passwordTextFieldImage!)
      passwordTextFieldImage?.addAnchors(left: width/14, top: 20, right: width/14, bottom: nil, withAnchor: .top, relativeToView: emailTextFieldImage)
      
      passwordTextField = headerInit.textFieldSetter(isClear: true, placeHolderString: "Password",isSecure: true)
      formView?.addSubview(passwordTextField!)
      passwordTextField?.addAnchors(left: 110, top: 43, right: width/14, bottom: nil, withAnchor: .top, relativeToView: emailTextFieldImage)
      passwordTextField!.delegate = self
      
      //ConfirmPassword
      passwordTextFieldImage2 = headerInit.uiImageViewSetter(uiImageName: "passwordimage")
      formView?.addSubview(passwordTextFieldImage2!)
      passwordTextFieldImage2?.addAnchors(left: width/14, top: 20, right: width/14, bottom: nil, withAnchor: .top, relativeToView: passwordTextFieldImage)
      
      passwordTextField2 = headerInit.textFieldSetter(isClear: true, placeHolderString: "Confirm Password",isSecure: true)
      formView?.addSubview(passwordTextField2!)
      passwordTextField2?.addAnchors(left: 110, top: 43, right: width/14, bottom: nil, withAnchor: .top, relativeToView: passwordTextFieldImage)
      passwordTextField2!.delegate = self
      
      
      singInButton = headerInit.uiButtonSetter(uiButtonNmae: "Crear Cuenta", textAligments: .center, cornerRadius: 15, isBackgroundClear: false, isUnderlined: false)
      view.addSubview(singInButton!)
      singInButton?.addAnchors(left: 40, top: 20, right: 40, bottom: nil, withAnchor: .top, relativeToView: formView)
      singInButton?.addTarget(self, action: #selector(Registration), for: .touchUpInside)
   }
   
   
   
   
   
}

extension RegisterViewController: UITextFieldDelegate {
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      passwordTextField!.endEditing(true)
      emailTextField!.endEditing(true)
      userTextField!.endEditing(true)
      passwordTextField2?.endEditing(true)
      return true
   }
   func textFieldDidEndEditing(_ textField: UITextField) {
      
   }
   
   @objc  func dismissView(){
      dismiss(animated: true, completion: nil)
   }
   
   @objc func Registration(){
      
      if userTextField?.text == "" || emailTextField?.text == "" || passwordTextField?.text == "" || passwordTextField2?.text == "" {
         let alert = headerInit.alertViewSetter(tittle: "Invalid Field", message: "Please fill all the fields in order to proceed", buttontittle: "ok")
         self.present(alert, animated: true, completion: nil)
      } else if (emailTextField?.text?.isValidEmail() != true) {
         let alert = headerInit.alertViewSetter(tittle: "Incorrect Email Format", message: "Please verify your email", buttontittle: "ok")
         self.present(alert, animated: true, completion: nil)
      }else if passwordTextField?.text != passwordTextField2?.text {
         let alert = headerInit.alertViewSetter(tittle: "Password Doesnt match", message: "Please verify that your password match", buttontittle: "ok")
         self.present(alert, animated: true, completion: nil)
      }else{
         Auth.auth().createUser(withEmail: (emailTextField?.text)!, password: (passwordTextField?.text)!) { authResult, error in
            if let e = error {
               print(e)
            }
            
         }
         
//         
//         let user = self.userTextField!.text
//         let email = self.emailTextField!.text
//         
//         self.dataBase.collection("UserInfo").addDocument(data: ["UserName": user! , "Email": email!]) { (error) in
//            if let e = error {
//               print("There was a issue saving data to firestore, \(e)")
//            } else {
//               print("Successfully saved data.")
//            }
//         }
         
         
         let alert = headerInit.alertViewSetter(tittle: "Registration completed", message: "Thank you for joining", buttontittle: "")
         
         alert.addAction(UIAlertAction(title: "Go back and login", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
            self.dismissView()})
         )
         self.present(alert, animated: true, completion: nil)
      }
      
   }
   
}

extension String {
   func isValidEmail() -> Bool {
      
      let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
      return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
   }
}

extension RegisterViewController{
   @objc func dismissKeyboard() {
       view.endEditing(true)
   }
}
