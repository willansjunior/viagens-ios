//
//  TableViewCell.swift
//  viagens
//
//  Created by Willans Júnior on 10/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    
    func configCell(_ viagem:Viagem) {
        labelTitulo.text = viagem.titulo
        labelQuantidadeDias.text = viagem.quantidadeDias == 1 ? "1 dia" : "\(viagem.quantidadeDias) dias"
        labelPreco.text = "R$ \(viagem.preco)"
        imagem.image = UIImage(named: viagem.imagem)
        
        //Arredondar bordas da imagem
        imagem.layer.cornerRadius = 10
        imagem.layer.masksToBounds = true
    }

}
