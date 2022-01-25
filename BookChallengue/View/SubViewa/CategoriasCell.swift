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
    var imageProduct : UIImageView?
    
    var libro : setNewLibro?
    
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(libro : setNewLibro){
        super.init(style: .default, reuseIdentifier: nil)
        self.libro = libro
        self.backgroundColor = .clear
        
        initUI()
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 20, height: height/5 - 10))
        ownContent?.backgroundColor = .blue
        ownContent?.layer.cornerRadius = 10
        self.addSubview(ownContent!)
        
        
        tituloLibro = UILabel(frame: CGRect(x: 5, y: 5, width: width/2, height: 20))
        tituloLibro?.text = libro?.titulo
        tituloLibro?.textAlignment = .left
        tituloLibro?.font = .boldSystemFont(ofSize: 18)
        ownContent?.addSubview(tituloLibro!)
        
        
        
        addButton = UIButton(frame: CGRect(x: 10, y: (height/5 - 10) - 45, width: 90, height: 35))
        addButton?.backgroundColor = .white
        addButton?.setTitle("Agregar", for: .normal)
        addButton?.setTitleColor(.orange, for: .normal) // Modificamos el color del titulo del boton
        addButton?.layer.borderColor = UIColor.orange.cgColor
        addButton?.layer.borderWidth = 1 // Aqui definimos el ancho del borde
        addButton?.layer.cornerRadius = 10
        
        ownContent?.addSubview(addButton!)
        
        
        
        imageProduct = UIImageView(frame: CGRect(x: width / 2, y: 10, width: width / 2 - 30, height: height/5 - 30))
        imageProduct?.image = UIImage(named: libro?.image ?? "")
        imageProduct?.layer.cornerRadius = 10
        imageProduct?.backgroundColor = .red
      //  imageProduct?.contentMode = .scaleAspectFit
        imageProduct?.layer.masksToBounds = true
        
        ownContent?.addSubview(imageProduct!)

        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
