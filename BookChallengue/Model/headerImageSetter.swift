import UIKit
import Foundation
struct initializerUI{
    var placeHolder: NSAttributedString?
    let backgroundButtoncolor = UIColor(displayP3Red: 79/255, green: 95/255, blue: 111/255, alpha: 1)
    let textColor = UIColor(displayP3Red: 61/255, green: 68/255, blue: 76/255, alpha: 1)
    let placeHolderColor = UIColor(displayP3Red: 61/255, green: 68/255, blue: 76/255, alpha: 0.5)
    var uiImage: UIImageView?
    
    
    mutating func uiImageViewSetter (_ uiImageName: String) -> UIImageView{
        uiImage = UIImageView()
        uiImage?.image = UIImage(named: uiImageName)

        return uiImage!
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


