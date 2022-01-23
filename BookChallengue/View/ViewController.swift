//
//  ViewController.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 22/01/22.
//

import UIKit

class ViewController: UIViewController {
    
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
    var placeHolder: NSAttributedString?
    let backgroundButtoncolor = UIColor(displayP3Red: 79/255, green: 95/255, blue: 111/255, alpha: 1)
    let textColor = UIColor(displayP3Red: 61/255, green: 68/255, blue: 76/255, alpha: 1)
    let placeHolderColor = UIColor(displayP3Red: 61/255, green: 68/255, blue: 76/255, alpha: 0.5)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        uiInit()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    func uiInit(){
        
        headerImage = headerInit.uiImageViewSetter("headerimage")
        view.addSubview(headerImage!)
        headerImage?.addAnchorsAndSize(width: width, height: height/5, left: 0, top: 32, right: 0, bottom: nil)
        
        
        // MARK: Logo
        appIcon = headerInit.uiImageViewSetter("logo")
        view.addSubview(appIcon!)
        appIcon?.addAnchorsAndSize(width: width/4, height: width/4, left: width/3, top: -30, right: width/3, bottom: nil, withAnchor: .top, relativeToView: headerImage)
        
        // MARK: WelcomeLabel
        welcomeLabel = UILabel()
        welcomeLabel?.text = "¡Welcome!"
        welcomeLabel?.textColor = textColor
        welcomeLabel?.textAlignment = .center
        welcomeLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        view.addSubview(welcomeLabel!)
        welcomeLabel?.addAnchors(left: width/4, top: 20, right: width/4, bottom: nil, withAnchor: .top, relativeToView: appIcon)
        
        // MARK: Email Buttons
        emailTextFieldImage = UIImageView()
        emailTextFieldImage?.image = UIImage(named: "emailimage")
        view.addSubview(emailTextFieldImage!)
        emailTextFieldImage?.addAnchors(left: width/14, top: 30, right: width/14, bottom: nil, withAnchor: .top, relativeToView: welcomeLabel)

        emailTextField = UITextField()
        emailTextField?.attributedPlaceholder = placeHolderString("example@gmail.com")
        emailTextField?.textColor = textColor
        view.addSubview(emailTextField!)
        emailTextField?.addAnchors(left: width/3, top: 53, right: width/14, bottom: nil, withAnchor: .top, relativeToView: welcomeLabel)
        emailTextField!.delegate = self
        // MARK: password Buttons
        passwordTextFieldImage = UIImageView()
        passwordTextFieldImage?.image = UIImage(named: "passwordimage")
        view.addSubview(passwordTextFieldImage!)
        passwordTextFieldImage?.addAnchors(left: width/14, top: 5, right: width/14, bottom: nil, withAnchor: .top, relativeToView: emailTextFieldImage)

        passwordTextField = UITextField()
        passwordTextField?.attributedPlaceholder = placeHolderString("Password")
        passwordTextField?.textColor = textColor
        passwordTextField?.isSecureTextEntry = true
        view.addSubview(passwordTextField!)
        passwordTextField?.addAnchors(left: width/3, top: 28, right: width/14, bottom: nil, withAnchor: .top, relativeToView: emailTextFieldImage)
        passwordTextField!.delegate = self
        
        //MARK: LoginBUtton
        
        logInbutton = UIButton()
        logInbutton?.backgroundColor = backgroundButtoncolor
        logInbutton?.setTitle("Log in", for: .normal)
        logInbutton?.titleLabel?.textAlignment = .center
        logInbutton?.layer.cornerRadius = 15
        view.addSubview(logInbutton!)
        logInbutton?.addAnchorsAndSize(width: nil, height: height/16, left: width/14, top: 70, right: width/14, bottom: nil, withAnchor: .top, relativeToView: passwordTextField)
        
        //MARK: underbutton text
        registerLabel = UILabel()
        registerLabel?.text = "Doesnt have an account?"
        registerLabel?.textColor = textColor
        registerLabel?.font = UIFont(name: "HelveticaNeue", size: 17)
        view.addSubview(registerLabel!)
        registerLabel?.addAnchorsAndSize(width: width/3, height: height/20,left: width/10, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: logInbutton)
        
        
        registerButton = UIButton()
        registerButton?.setTitle("Sign up", for: .normal)
        registerButton?.backgroundColor = .clear
        registerButton?.setAttributedTitle(UnderLineString((registerButton?.currentTitle)!), for: .normal)
        registerButton?.titleLabel?.textAlignment = .left
        registerButton?.setTitleColor(textColor, for: .normal)
        view.addSubview(registerButton!)
        registerButton?.addAnchorsAndSize(width: width/4, height: height/20,left: nil, top: 5, right: width/10, bottom: nil, withAnchor: .top, relativeToView: logInbutton)
        registerButton?.addAnchors(left: 1, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: registerLabel)
        
        registerButton?.addTarget(self, action: #selector(RegisterField), for: .touchUpInside)



        
        
    }
    
    func placeHolderString(_ placeHolderString: String) -> NSAttributedString {
        let placeHolder = NSAttributedString(string: placeHolderString ,
                                             attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
        return placeHolder
    }

    func UnderLineString(_ underLineString: String) -> NSAttributedString {
        let underLine = NSAttributedString(string: underLineString ,
                                           attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        return underLine
    }
}



// setting delegate actions for UITEXTFIELD

extension ViewController: UITextFieldDelegate {
    
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

