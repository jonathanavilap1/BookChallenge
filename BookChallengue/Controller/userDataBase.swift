//
//  userDataBase.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 24/01/22.
//

import Foundation
var usuarioDB: [nuevoUsuario] = []
var currentUserIndex: Int? =  nil
var currentUserObj: nuevoUsuario?


class userDB {
    
    init(){
        let Jonathan = nuevoUsuario(email: "Jon", usuario: "Jonathan", password: "Jon")
        let adminUser = nuevoUsuario(email: "Admin", usuario: "admin", password: "admin")
        usuarioDB.append(Jonathan)
        usuarioDB.append(adminUser)
    }
    
    
    
    
    func addNewUser(usuarioInfo: nuevoUsuario){
        print(usuarioDB.isEmpty)
        usuarioDB.append(usuarioInfo)
        
        print((usuarioDB.last?.usuario)!)
    }
    
    func getDbArray() -> [nuevoUsuario]{
        
        return usuarioDB
    }
    
    func currentUserSetter(currentuser: Int){
        
        currentUserIndex = currentuser
    }
    func currentUserGetter() -> nuevoUsuario{
        currentUserObj =  usuarioDB[currentUserIndex ?? 0]
        return currentUserObj!
    }
}


