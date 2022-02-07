//
//  MenuTableViewCell.swift
//  PujolApp
//
//  Created by Teki on 17/01/22.
//

import Foundation
import UIKit

class CategoriasCell : UITableViewCell{
    
    var ownContent : UIView?
    var tituloLibro : UILabel?
    var autorLibro : UILabel?
    var categoriaLibro : UILabel?
    var addButton : UIButton?
    var imageLibro : UIImageView?
    var libro : BookModel?
   

    
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(libro : BookModel){
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
       imageLibro = UIImageView(image: UIImage(data: (libro?.imageWithData)!))
        imageLibro?.layer.cornerRadius = 10
        //  imageProduct?.contentMode = .scaleAspectFit
        imageLibro?.layer.masksToBounds = true
        ownContent?.addSubview(imageLibro!)
        imageLibro?.addAnchorsAndSize(width: width/4, height: nil, left: 5, top: 5, right: nil, bottom: 5)
        
        let tituloLabel = headerInit.uiLabelSetter(labelString: "Tittle", labelSize: 18, textaligment: .center, isBold: true, isHighLighted: true)
        ownContent?.addSubview(tituloLabel)
        tituloLabel.addAnchors(left: 5, top: 10, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        
       tituloLibro = headerInit.uiLabelSetter(labelString: (libro?.title)!, labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
        tituloLibro?.numberOfLines = 0
        ownContent?.addSubview(tituloLibro!)
        
        tituloLibro?.addAnchors(left: 10, top: nil, right: 55, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        tituloLibro?.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: tituloLabel)
        
        let byAutor = headerInit.uiLabelSetter(labelString: "by Autor", labelSize: 14, textaligment: .center, isBold: true, isHighLighted: true)
        ownContent?.addSubview(byAutor)
        byAutor.addAnchors(left: 5, top: nil, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        byAutor.addAnchors(left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: tituloLibro)
        
       autorLibro = headerInit.uiLabelSetter(labelString: (libro?.authors?[0]) ?? "", labelSize: 14, textaligment: .center, isBold: false, isHighLighted: false)
        autorLibro?.numberOfLines = 0
        ownContent?.addSubview(autorLibro!)
        
        autorLibro?.addAnchors(left: 10, top: nil, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        autorLibro?.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: byAutor)
        
        let more = headerInit.uiImageViewSetter(uiImageName: "more")
        ownContent?.addSubview(more)
        more.addAnchorsAndSize(width: 50, height: 50, left: 200, top: 50, right: nil, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


