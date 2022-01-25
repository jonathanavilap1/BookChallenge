//
//  userDataBase.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 24/01/22.
//

import Foundation

class userDB {
    
var usuarioDB: [nuevoUsuario] = []

let adminUser = nuevoUsuario(email: "admin@gmail.com", usuario: "admin", password: "admin")
    
    
func addNewUser(usuarioInfo: nuevoUsuario){
    usuarioDB.append(adminUser)
    print(usuarioDB.isEmpty)
    usuarioDB.append(usuarioInfo)
    
    print((usuarioDB.last?.usuario)!)
}
    
}


