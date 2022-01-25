//
//  Books.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 24/01/22.
//

import Foundation

class libreria {

    var libreria: [categorias]?
 
    init(libreria: [categorias]){
        self.libreria = libreria
    }
}

class categorias{
    var categoria: String?
    var libro: [libro]?
    
    init (categoria: String, libro: [libro]){
        self.categoria = categoria
        self.libro = libro
    }
}

class libro{
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

class categorias2{
    var categoria2: String?
    var libro: [[String:String]?]
    
    init (categoria2: String, libro: [[String:String]]){
        self.categoria2 = categoria2
        self.libro = libro
    }
}

let Biologia = categorias2(categoria2: "Biologia", libro: [["Titulo": "Introduction to Human Osteology", "Autor": "Kenneth Beals", "Categoria": "Biologia", "Imagen": "1"],["Titulo": "Manual de microbiologia general", "Autor": "Carina Magnoli", "Categoria": "Biologia", "Imagen": "2"],["Titulo": "Human Biology - Nervous System", "Autor": "Stanford University", "Categoria": "Biologia", "Imagen": "3"],["Titulo": "El Origen de las Especies", "Autor": "Charles Darwin", "Categoria": "Biologia", "Imagen": "4"],["Titulo": "Conceptos claves en biologia", "Autor": "Sergio Martorelli", "Categoria": "Biologia", "Imagen": "5"]])
    
//[Titulo: "Introduction to Human Osteology", Autor: "Kenneth Beals", Categoria: "Biologia", Imagen: "1"],[Titulo: "Manual de microbiologia general", Autor: "Carina Magnoli", Categoria: "Biologia", Imagen: "2"],[Titulo: "Human Biology - Nervous System", Autor: "Stanford University", Categoria: "Biologia", Imagen: "3"],[Titulo: "El Origen de las Especies", Autor: "Charles Darwin", Categoria: "Biologia", Imagen: "4"],[Titulo: "Conceptos claves en biologia", Autor: "Sergio Martorelli", Categoria: "Biologia", Imagen: "5"],
//
//[Titulo: "Electromagnetics Vol.1", Autor: "Steven W. Ellingson", Categoria: "Fisica", Imagen: "6"],[Titulo: "Origenes cuanticos de las asimetrias cosmologicas", Autor: "Adolfo J. De Unanue Tiscareño", Categoria: "Fisica", Imagen: "7"],[Titulo: "Fisicoquimica basica", Autor: "Alberto L. Capparelli", Categoria: "Fisica", Imagen: "8"],[Titulo: "Fisica de oscilaciones, ondas y optica", Autor: "Hernan Vivas C.", Categoria: "Fisica", Imagen: "9"],[Titulo: "Nanociencia y nanotecnologia", Autor: "Jose Angel Martin Gago", Categoria: "Fisica", Imagen: "10"],
//
//
//
//[Titulo: "Fundamentals of Mathematics", Autor: "Denny Burzynski", Categoria: "Matematicas", Imagen: "11"],[Titulo: "Trigonometry", Autor: "Ted Sundstrom ", Categoria: "Matematicas", Imagen: "12"],[Titulo: "Geometria Proyectiva", Autor: "Gerard Romo Garrido", Categoria: "Matematicas", Imagen: "13"],[Titulo: "Apuntes de calculo numerico", Autor: "Sebastian A. Hernandez", Categoria: "Matematicas", Imagen: "14"],[Titulo: "Diﬀerential Geometrical Theory of Statistics", Autor: "Frederic Barbaresco ", Categoria: "Matematicas", Imagen: "15"],
//
//
//
//[Titulo: "Analytical Chemistry 2.1", Autor: "David Harvey", Categoria: "Quimica", Imagen: "16"],[Titulo: "Cubisistema de los elementos quimicos", Autor: "Concepcion Sanchez Lopez", Categoria: "Quimica", Imagen: "17"],[Titulo: "Introduccion a la Quimica Organica", Autor: "Gustavo Romanelli", Categoria: "Quimica", Imagen: "18"],[Titulo: "Differential Equations in Applied Chemistry", Autor: "Frank Lauren Hitchcock", Categoria: "Quimica", Imagen: "19"],[Titulo: "Noble Gases. An Overview", Autor: "Clark Shove Robinson", Categoria: "Quimica", Imagen: "20"],
//
//
//
//[Titulo: "3D Printed Microfluidic Devices", Autor: "Savas Tasoglu", Categoria: "Tecnologia", Imagen: "21"],[Titulo: "Exploring the Internet: A Technical Travelogue", Autor: "Carl Malamud", Categoria: "Tecnologia", Imagen: "22"],[Titulo: "Learning in Virtual Worlds", Autor: "Terry Anderson ", Categoria: "Tecnologia", Imagen: "23"],[Titulo: "The Web as History", Autor: "Niels Brugger", Categoria: "Tecnologia", Imagen: "24"],[Titulo: "From Bricks to Brains", Autor: "Michael R.W Dawson", Categoria: "Tecnologia", Imagen: "25"],
//}
