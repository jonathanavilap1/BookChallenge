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
    var userController = userDB()
    var usuarioDB: [nuevoUsuario] = []
    
    
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
        
        headerImage = headerInit.uiImageViewSetter(uiImageName: "headerimage2")
        view.addSubview(headerImage!)
        headerImage?.addAnchorsAndSize(width: width, height: height/8, left: -20, top: 32, right: 0, bottom: nil)
        
        
        // MARK: Logo
        appIcon = headerInit.uiImageViewSetter(uiImageName: "logo")
        view.addSubview(appIcon!)
        appIcon?.addAnchorsAndSize(width: width/4, height: width/4, left: width/3, top: -10, right: width/3, bottom: nil, withAnchor: .top, relativeToView: headerImage)
        
        // MARK: WelcomeLabel
        
        welcomeLabel = headerInit.uiLabelSetter(labelString: "Welcome", labelSize: 30, textaligment: .center,isBold: true, isHighLighted: false)
        view.addSubview(welcomeLabel!)
        welcomeLabel?.addAnchors(left: width/4, top: 20, right: width/4, bottom: nil, withAnchor: .top, relativeToView: appIcon)
        
        // MARK: Email Buttons
        emailTextFieldImage = headerInit.uiImageViewSetter(uiImageName: "emailimage")
        view.addSubview(emailTextFieldImage!)
        emailTextFieldImage?.addAnchors(left: width/14, top: 30, right: width/14, bottom: nil, withAnchor: .top, relativeToView: welcomeLabel)
        
        emailTextField = headerInit.textFieldSetter(isClear: true, placeHolderString: "example@gmail.com",isSecure: false)
        view.addSubview(emailTextField!)
        emailTextField?.addAnchors(left: width/3, top: 53, right: width/14, bottom: nil, withAnchor: .top, relativeToView: welcomeLabel)
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
    
    @objc func logInAction(){
        usuarioDB =  userController.getDbArray()
        
        let inputUser = emailTextField?.text
        let inputPassword = passwordTextField?.text
        let usuarioDB = userController.getDbArray()
        let libraryVc = LibraryViewController()
        libraryVc.modalPresentationStyle = .fullScreen
        
        //        if let index = usuarioDB.firstIndex(where: { $0.email == inputUser}){
        //        let fetchedDbUser = usuarioDB[index]
        //            if inputUser == fetchedDbUser.usuario || inputPassword == fetchedDbUser.password{
        //                userController.currentUserSetter(currentuser: index)
        present(libraryVc, animated: true, completion: nil)
        //            }}else{
        //             let alert = headerInit.alertViewSetter(tittle: "Invalid Info", message: "Please verify input information", buttontittle: "ok")
        //                self.present(alert, animated: true, completion: nil)
        
        //        }
    }
    
}


