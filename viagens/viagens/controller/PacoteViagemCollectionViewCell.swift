//
//  PacoteViagemCollectionViewCell.swift
//  viagens
//
//  Created by Willans Júnior on 14/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func configCell(pacote:PacoteViagem) {
        self.labelTitulo.text = pacote.viagem.titulo
        self.labelQuantidadeDias.text = "\(pacote.viagem.quantidadeDias) dias"
        self.labelPreco.text = "R$ \(pacote.viagem.preco)"
        self.imagemViagem.image = UIImage(named: pacote.viagem.imagem)
        
        //tamanho da borda
        self.layer.borderWidth = 0.5
        
        //cor para a borda
        self.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        
        //arredondando a borda
        self.layer.cornerRadius = 8
    }
    
}
