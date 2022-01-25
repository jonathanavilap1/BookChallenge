//
//  Books.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 24/01/22.
//

import Foundation

class setLibreria {

    var categorias: [setNewcategorias]?
    var allLibro: [allcategorias]?
    init(categorias: [setNewcategorias], allLibro: [allcategorias]){
        self.categorias = categorias
        self.allLibro = allLibro
    }
}

class setNewcategorias{
    var categoria: String?
    
    var libro: [setNewLibro]?

    
    init (categoria: String, libro: [setNewLibro]){
        self.categoria = categoria
        self.libro = libro
      
    }
}

class allcategorias{
    var libro: [setNewLibro]?

    
    init ( libro: [setNewLibro]){

        self.libro = libro
    }
}

class setNewLibro{
    var titulo: String?
    var autor: String?
    var categorias: String?
    var image: String?
    
    init(titulo: String, autor: String, categorias: String, image: String) {
        self.titulo = titulo
        self.autor = autor
        self.categorias = categorias
        self.image = image
    }
}

