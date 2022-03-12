//
//  MenuTableViewCell.swift
//  PujolApp
//
//  Created by Teki on 17/01/22.
//

import Foundation
import UIKit

class charactersCell : UITableViewCell{
    
    var ownContent : UIView?
    var tituloLibro : UILabel?
    var autorLibro : UILabel?
    var categoriaLibro : UILabel?
    var patronusLibro: UILabel?
    var house: UILabel?
    var addButton : UIButton?
    var imageLibro : UIImageView?
    var libro : HpModel?
   

    
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(libro : HpModel){
        super.init(style: .default, reuseIdentifier: nil)
        self.libro = libro
        self.backgroundColor = .clear
        
        initUI()
    }
    
    func initUI(){
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 20, height: height/5 - 10))
        ownContent?.backgroundColor = .white
        ownContent?.layer.borderColor = headerInit.backgroundButtoncolor.cgColor
        ownContent?.layer.cornerRadius = 15
        self.addSubview(ownContent!)
       imageLibro = UIImageView(image: UIImage(data: (libro?.image)!))
        imageLibro?.layer.cornerRadius = 10
        //  imageProduct?.contentMode = .scaleAspectFit
        imageLibro?.layer.masksToBounds = true
        ownContent?.addSubview(imageLibro!)
        imageLibro?.addAnchorsAndSize(width: width/4, height: nil, left: 5, top: 5, right: nil, bottom: 5)
        
        let tituloLabel = headerInit.uiLabelSetter(labelString: "Character", labelSize: 15, textaligment: .center, isBold: true, isHighLighted: true)
        ownContent?.addSubview(tituloLabel)
        tituloLabel.addAnchors(left: 5, top: 5, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        
       tituloLibro = headerInit.uiLabelSetter(labelString: (libro?.name)!, labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
        tituloLibro?.numberOfLines = 0
        ownContent?.addSubview(tituloLibro!)
        
        tituloLibro?.addAnchors(left: 5, top: nil, right: 55, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        tituloLibro?.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: tituloLabel)
        
        let byAutor = headerInit.uiLabelSetter(labelString: "by Autor", labelSize: 14, textaligment: .center, isBold: true, isHighLighted: true)
        ownContent?.addSubview(byAutor)
        byAutor.addAnchors(left: 5, top: nil, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        byAutor.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: tituloLibro)
        
       autorLibro = headerInit.uiLabelSetter(labelString: (libro?.actor) ?? "", labelSize: 14, textaligment: .center, isBold: false, isHighLighted: false)
        autorLibro?.numberOfLines = 0
        ownContent?.addSubview(autorLibro!)
        
        autorLibro?.addAnchors(left: 5, top: nil, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        autorLibro?.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: byAutor)
       
       let patronuslabel = headerInit.uiLabelSetter(labelString: "Patronus:", labelSize: 14, textaligment: .center, isBold: true, isHighLighted: true)
       ownContent?.addSubview(patronuslabel)
       patronuslabel.addAnchors(left: 5, top: nil, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
       patronuslabel.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: autorLibro)
       
        patronusLibro = headerInit.uiLabelSetter(labelString: (libro?.patronus) ?? "", labelSize: 14, textaligment: .center, isBold: false, isHighLighted: false)
       patronusLibro?.numberOfLines = 0
        ownContent?.addSubview(patronusLibro!)
        
       patronusLibro?.addAnchors(left: 5, top: nil, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
       patronusLibro?.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: patronuslabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


