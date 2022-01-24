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
    
    
    //MARK: creation of images
    mutating func uiImageViewSetter (_ uiImageName: String) -> UIImageView{
        uiImage = UIImageView()
        uiImage?.image = UIImage(named: uiImageName)

        return uiImage!
    }
    
    //MARK: creation of labels
    mutating func uiLabelSetter (_ labelString: String,_ labelSize: CGFloat, _ textaligment: NSTextAlignment, _ isBold: Bool, isHighLighted: Bool) -> UILabel{
        uiLabel = UILabel()
        uiLabel?.font = UIFont(name: "HelveticaNeue", size: labelSize)
        if isBold == true {
            uiLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: labelSize)
        }
        if isHighLighted == true {
            uiLabel?.highlightedTextColor = textColorHighligthed
        }
        
        uiLabel?.text = labelString
        uiLabel?.textColor = textColor
        uiLabel?.textAlignment = textaligment
        
        return uiLabel!
    }
    
    //MARK: creation of placeHolders
    mutating func placeHolderString(_ placeHolderString: String,_ isSecure: Bool) -> UITextField {
        stringPlaceHolder = UITextField()
        if isSecure == true{
            stringPlaceHolder?.isSecureTextEntry = true
        }else{
            stringPlaceHolder?.isSecureTextEntry = false
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
    
    
    //MARK: creation of underline property
    func UnderLineString(_ underLineString: String) -> NSAttributedString {
        let underLine = NSAttributedString(string: underLineString ,
                                           attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        return underLine
    }
    
}


