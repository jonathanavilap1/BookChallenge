import UIKit
import Foundation
struct initializerUI{
    var stringPlaceHolder: UITextField?
    var placeHolder: NSAttributedString?
    let backgroundButtoncolor = UIColor(displayP3Red: 79/255, green: 95/255, blue: 111/255, alpha: 1)
    let textColor = UIColor(displayP3Red: 61/255, green: 68/255, blue: 76/255, alpha: 1)
    let placeHolderColor = UIColor(displayP3Red: 61/255, green: 68/255, blue: 76/255, alpha: 0.5)
    let textColorHighligthed = UIColor(displayP3Red: 50/255, green: 160/255, blue: 168/255, alpha: 1)
    var uiImage: UIImageView?
    var uiLabel: UILabel?
    var uiButton: UIButton?
    var uiView: UIView?
    let viewBackGroundColor = UIColor(displayP3Red: 89/255, green: 194/255, blue: 230/255, alpha: 1)
    var alert: UIAlertController?

    
    
    //MARK: creation of images
    mutating func uiImageViewSetter ( uiImageName: String) -> UIImageView{
        uiImage = UIImageView()
        uiImage?.image = UIImage(named: uiImageName)

        return uiImage!
    }
    
    //MARK: creation of labels
    mutating func uiLabelSetter ( labelString: String, labelSize: CGFloat,  textaligment: NSTextAlignment,  isBold: Bool, isHighLighted: Bool) -> UILabel{
        uiLabel = UILabel()
        uiLabel?.font = UIFont(name: "HelveticaNeue", size: labelSize)
        if isBold == true {
            uiLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: labelSize)
        }
        if isHighLighted == true {
            uiLabel?.highlightedTextColor = textColorHighligthed
            uiLabel?.isHighlighted = true
        }
        
        uiLabel?.text = labelString
        uiLabel?.textColor = textColor
        uiLabel?.textAlignment = textaligment
        
        return uiLabel!
    }
    
    //MARK: creation of placeHolders
    mutating func textFieldSetter( isClear: Bool, placeHolderString: String, isSecure: Bool) -> UITextField {

        stringPlaceHolder = UITextField()
        stringPlaceHolder?.textColor = textColor
        if isClear != true {
            stringPlaceHolder?.backgroundColor = .white
            stringPlaceHolder?.layer.borderWidth = 1
            stringPlaceHolder?.layer.borderColor = textColor.cgColor
        }
        
        if isSecure == true{
            stringPlaceHolder?.isSecureTextEntry = true
        }
        
        stringPlaceHolder?.attributedPlaceholder = NSAttributedString(string: placeHolderString ,
                                                                      attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
        return stringPlaceHolder!
    }
    
    
    //MARK: creation of buttons
    
    mutating func uiButtonSetter( uiButtonNmae: String, textAligments: NSTextAlignment,  cornerRadius: CGFloat, isBackgroundClear: Bool, isUnderlined:Bool) -> UIButton{
        
        uiButton = UIButton()
        uiButton?.backgroundColor = backgroundButtoncolor

        if isBackgroundClear == true {
            uiButton?.backgroundColor = .clear
            uiButton?.setTitleColor(textColor, for: .normal)
        }
        
        if isUnderlined == true {
            uiButton?.setAttributedTitle(NSAttributedString(string: uiButtonNmae ,
                                                            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]), for: .normal)
            
        }
        
        uiButton?.setTitle(uiButtonNmae, for: .normal)
        uiButton?.titleLabel?.textAlignment = textAligments
        uiButton?.layer.cornerRadius = cornerRadius
        
        
        return uiButton!
    }
    
    
    //MARK: creation of block/view
    
    mutating func uiViewSetter() -> UIView {
        uiView = UIView()
        uiView?.layer.cornerRadius = 20
        uiView?.backgroundColor = .white
        uiView?.layer.borderWidth = 2
        uiView?.layer.borderColor = backgroundButtoncolor.cgColor
        return uiView!
    }
    
    //MARK: Alert creation
    
    func alertViewSetter(tittle: String, message: String, buttontittle: String?) -> UIAlertController{

        let alert = UIAlertController(title: tittle, message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: buttontittle, style: UIAlertAction.Style.default, handler: nil))
        
        return alert
    }
    
    
}


