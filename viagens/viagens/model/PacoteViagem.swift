//
//  PacoteViagem.swift
//  viagens
//
//  Created by Willans Júnior on 24/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class PacoteViagem: NSObject {
    
    let nomeHotel:String
    let descricao:String
    let dataViagem:String
    let viagem:Viagem
    
    init(nomeHotel:String, descricao:String, dataViagem:String, viagem:Viagem) {
        self.nomeHotel = nomeHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.viagem = viagem
    }

}
