//
//  libraryDataBase.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 25/01/22.
//

import Foundation

class LibraryDB{
    var libreria: setLibreria?
    let libroBio1 = setNewLibro(titulo: "Introduction to Human Osteology", autor: "Kenneth Beals",categorias: "Biologia", image: "1")
    
    let libroBio2 = setNewLibro(titulo: "Manual de microbiologia general", autor: "Carina Magnoli",categorias: "Biologia", image: "2")
    
    let libroBio3 = setNewLibro(titulo: "Human Biology - Nervous System", autor: "Stanford University",categorias: "Biologia", image: "3")
    
    let libroBio4 = setNewLibro(titulo: "El Origen de las Especies", autor: "Charles Darwin",categorias: "Biologia", image: "4")
    
    let libroBio5 = setNewLibro(titulo: "Conceptos claves en biologia", autor: "Sergio Martorelli",categorias: "Biologia", image: "5")
    
    let libroFisic1 = setNewLibro(titulo: "Electromagnetics Vol.1", autor: "Steven W. Ellingson",categorias: "Fisica", image: "6")
    
    let libroFisic2 = setNewLibro(titulo: "Origenes cuanticos de las asimetrias cosmologicas", autor: "Adolfo J. De Unanue Tiscareño",categorias: "Fisica", image: "7")
    
    let libroFisic3 = setNewLibro(titulo: "Fisicoquimica basica", autor: "Alberto L. Capparelli",categorias: "Fisica", image: "8")
    
    let libroFisic4 = setNewLibro(titulo: "Fisica de oscilaciones, ondas y optica", autor: "Hernan Vivas C.",categorias: "Fisica", image: "9")
    
    let libroFisic5 = setNewLibro(titulo: "Nanociencia y nanotecnologia", autor: "Jose Angel Martin Gago",categorias: "Fisica", image: "10")
    
    let libroMat1 = setNewLibro(titulo: "Fundamentals of Mathematics", autor: "Denny Burzynski",categorias: "Matematicas", image: "11")
    
    let libroMat2 = setNewLibro(titulo: "Trigonometry", autor: "Ted Sundstrom ",categorias: "Matematicas", image: "12")
    
    let libroMat3 = setNewLibro(titulo: "Geometria Proyectiva", autor: "Gerard Romo Garrido",categorias: "Matematicas", image: "13")
    
    let libroMat4 = setNewLibro(titulo: "Apuntes de calculo numerico", autor: "Sebastian A. Hernandez",categorias: "Matematicas", image: "14")
    
    let libroMat5 = setNewLibro(titulo: "Diﬀerential Geometrical Theory of Statistics", autor: "Frederic Barbaresco ",categorias: "Matematicas", image: "15")
    
    
    
    init(){
        let biology = setNewcategorias(categoria: "Biologia", libro:[libroBio1,libroBio2,libroBio3,libroBio4,libroBio5])
        let fisic = setNewcategorias(categoria: "Fisica", libro:[libroFisic1,libroFisic2,libroFisic3,libroFisic4,libroFisic5])
        let math = setNewcategorias(categoria: "Math", libro:[libroMat1,libroMat2,libroMat3,libroMat4,libroMat5])
        
        let allBooks = allcategorias(libro:  [libroBio1,libroBio2,libroBio3,libroBio4,libroBio5,libroFisic1,libroFisic2,libroFisic3,libroFisic4,libroFisic5,libroMat1,libroMat2,libroMat3,libroMat4,libroMat5])

        
        libreria = setLibreria(categorias: [biology,fisic,math], allLibro: [allBooks])
    
    }

    
    //
    //
    //
    //[Titulo: "Analytical Chemistry 2.1", Autor: "David Harvey", Categoria: "Quimica", Imagen: "16"],[Titulo: "Cubisistema de los elementos quimicos", Autor: "Concepcion Sanchez Lopez", Categoria: "Quimica", Imagen: "17"],[Titulo: "Introduccion a la Quimica Organica", Autor: "Gustavo Romanelli", Categoria: "Quimica", Imagen: "18"],[Titulo: "Differential Equations in Applied Chemistry", Autor: "Frank Lauren Hitchcock", Categoria: "Quimica", Imagen: "19"],[Titulo: "Noble Gases. An Overview", Autor: "Clark Shove Robinson", Categoria: "Quimica", Imagen: "20"],
    //
    //
    //
    //[Titulo: "3D Printed Microfluidic Devices", Autor: "Savas Tasoglu", Categoria: "Tecnologia", Imagen: "21"],[Titulo: "Exploring the Internet: A Technical Travelogue", Autor: "Carl Malamud", Categoria: "Tecnologia", Imagen: "22"],[Titulo: "Learning in Virtual Worlds", Autor: "Terry Anderson ", Categoria: "Tecnologia", Imagen: "23"],[Titulo: "The Web as History", Autor: "Niels Brugger", Categoria: "Tecnologia", Imagen: "24"],[Titulo: "From Bricks to Brains", Autor: "Michael R.W Dawson", Categoria: "Tecnologia", Imagen: "25"],
    //}

}


