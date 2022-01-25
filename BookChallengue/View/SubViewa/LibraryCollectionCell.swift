//
//  LibraryCollectionCell.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 25/01/22.
//

import Foundation
import UIKit
var headerInit = initializerUI()
class LibraryCollectionCell : UICollectionViewCell{
    
    var imageProduct : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        
        
        
        self.addSubview(imageProduct)
        imageProduct.addAnchors(left: 10, top: 10, right: 10, bottom: 30)
        
        
    }
    
    func setData(libro : setNewLibro){
        imageProduct.image = UIImage(named: libro.image ?? "")
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
