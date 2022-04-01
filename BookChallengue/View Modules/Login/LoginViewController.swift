import UIKit
import Firebase

class LoginViewController: UIViewController{
   
   var headerInit = initializerUI()
   var headerImage: UIImageView?
   var appIcon: UIImageView?
   var welcomeLabel : UILabel?
   var emailTextField: UITextField?
   var emailTextFieldImage: UIImageView?
   var passwordTextField: UITextField?
   var passwordTextFieldImage: UIImageView?
   var logInbutton: UIButton?
   var registerLabel: UILabel?
   var registerButton: UIButton?
   var width = UIScreen.main.bounds.width
   var height = UIScreen.main.bounds.height
   var dataSource2: characterArray?
   var bookModelfetch: BookArray?
   let defaults = UserDefaults.standard
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
      view.addGestureRecognizer(tap)
      uiInit()
      // Do any additional setup after loading the view.
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle {
      return .darkContent
   }
   
   func uiInit(){
      
      headerImage = headerInit.uiImageViewSetter(uiImageName: "headerimage")
      view.addSubview(headerImage!)
      headerImage?.addAnchorsAndSize(width: width, height: height/6, left: 5, top: 35, right: 5, bottom: nil)
      
      
      // MARK: Logo
      appIcon = headerInit.uiImageViewSetter(uiImageName: "logo")
      view.addSubview(appIcon!)
      appIcon?.addAnchorsAndSize(width: width/2.5, height: width/2.2, left: width/3.5, top: 40, right: width/3.5, bottom: nil, withAnchor: .top, relativeToView: headerImage)
      
      // MARK: WelcomeLabel
      
      welcomeLabel = headerInit.uiLabelSetter(labelString: "Welcome", labelSize: 30, textaligment: .center,isBold: true, isHighLighted: false)
      view.addSubview(welcomeLabel!)
      welcomeLabel?.addAnchors(left: width/4, top: 20, right: width/4, bottom: nil, withAnchor: .top, relativeToView: appIcon)
      
      // MARK: Email Buttons
      emailTextFieldImage = headerInit.uiImageViewSetter(uiImageName: "emailimage")
      view.addSubview(emailTextFieldImage!)
      emailTextFieldImage?.addAnchors(left: width/14, top: 50, right: width/14, bottom: nil, withAnchor: .top, relativeToView: welcomeLabel)
      
      emailTextField = headerInit.textFieldSetter(isClear: true, placeHolderString: "example@gmail.com",isSecure: false)
      view.addSubview(emailTextField!)
      emailTextField?.addAnchors(left: width/3, top: 73, right: width/14, bottom: nil, withAnchor: .top, relativeToView: welcomeLabel)
      emailTextField!.delegate = self
      
      // MARK: password Buttons
      passwordTextFieldImage = headerInit.uiImageViewSetter(uiImageName: "passwordimage")
      view.addSubview(passwordTextFieldImage!)
      passwordTextFieldImage?.addAnchors(left: width/14, top: 5, right: width/14, bottom: nil, withAnchor: .top, relativeToView: emailTextFieldImage)
      
      passwordTextField = headerInit.textFieldSetter(isClear: true, placeHolderString: "Password",isSecure: true)
      view.addSubview(passwordTextField!)
      passwordTextField?.addAnchors(left: width/3, top: 28, right: width/14, bottom: nil, withAnchor: .top, relativeToView: emailTextFieldImage)
      passwordTextField!.delegate = self
      
      //MARK: LoginBUtton
      
      logInbutton = headerInit.uiButtonSetter(uiButtonNmae: "Log In", textAligments: .center, cornerRadius: 15, isBackgroundClear: false, isUnderlined: false)
      view.addSubview(logInbutton!)
      logInbutton?.addAnchorsAndSize(width: nil, height: height/16, left: width/14, top: 70, right: width/14, bottom: nil, withAnchor: .top, relativeToView: passwordTextField)
      
      //MARK: underbutton text
      registerLabel = headerInit.uiLabelSetter(labelString: "Doesnt have an account?", labelSize: 17, textaligment: .left,isBold: false, isHighLighted: false)
      view.addSubview(registerLabel!)
      registerLabel?.addAnchorsAndSize(width: width/3, height: height/20,left: width/10, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: logInbutton)
      
      
      registerButton = headerInit.uiButtonSetter(uiButtonNmae: "Sing up", textAligments: .left, cornerRadius: 0,isBackgroundClear: true, isUnderlined: true)
      view.addSubview(registerButton!)
      registerButton?.addAnchorsAndSize(width: width/4, height: height/20,left: nil, top: 5, right: width/10, bottom: nil, withAnchor: .top, relativeToView: logInbutton)
      registerButton?.addAnchors(left: 1, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: registerLabel)
      
      registerButton?.addTarget(self, action: #selector(RegisterField), for: .touchUpInside)
      
      logInbutton?.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
      
   }
   
}


// setting delegate actions for UITEXTFIELD
extension LoginViewController: UITextFieldDelegate {
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      passwordTextField!.endEditing(true)
      emailTextField!.endEditing(true)
      return true
   }
   
   func textFieldDidEndEditing(_ textField: UITextField) {
      
      
   }
   
   @objc func RegisterField(){
      
      let registerVC = RegisterViewController()
      registerVC.modalPresentationStyle = .fullScreen
      present(registerVC, animated: true, completion: nil)
   }
   
   
}

extension LoginViewController{
   
   
   
   @objc func logInAction(){
      lazy var alert = UIAlertController()
      let libraryVc = LibraryViewController()
      libraryVc.modalPresentationStyle = .fullScreen
      libraryVc.dataSource = bookModelfetch
      libraryVc.dataSource2 = dataSource2
      if (passwordTextField?.text?.isEmpty)! || (emailTextField?.text?.isEmpty)!  {
         alert = headerInit.alertViewSetter(tittle: "Invalid Info", message: "Please verify input information", buttontittle: "ok")
         self.present(alert, animated: true, completion: nil)
      } else {
         if let password = passwordTextField?.text, let email = emailTextField?.text {
            Auth.auth().signIn(withEmail: email, password: password) {
               [weak self] authResult, error in
               if let e = error {
                  print(e)
                  alert = self!.headerInit.alertViewSetter(tittle: "Invalid Info", message: "Please verify input information", buttontittle: "ok")
                  self?.present(alert, animated: true, completion: nil)
               }else {
                  self?.defaults.set(authResult?.user.email, forKey: "loggedin")
                  libraryVc.currentUser = authResult?.user.email ?? ""
                  self?.present(libraryVc, animated: true, completion: nil)
               }
            }
         }
      }
   }
   
   
   func didFailWithError(error: Error) {
      print(error)
   }
   
   //   func didUpdateBook(_ bookManager: BookManager, bookModel: BookArray) {
   //      DispatchQueue.main.sync {
   //
   //         bookModelfetch = bookModel
   //
   //      }
   
   //   }
   
   @objc func dismissKeyboard() {
      //Causes the view (or one of its embedded text fields) to resign the first responder status.
      view.endEditing(true)
   }
   
}
