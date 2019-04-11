//
//  Viagem.swift
//  viagens
//
//  Created by Willans Júnior on 10/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import Foundation

class Viagem : NSObject {
    
    let titulo:String
    let quantidadeDias:Int
    let preco:String
    let imagem:String
    
    init(titulo:String, quantidadeDias:Int, preco:String, imagem:String) {
        self.titulo = titulo
        self.quantidadeDias = quantidadeDias
        self.preco = preco
        self.imagem = imagem
    }
    
}
