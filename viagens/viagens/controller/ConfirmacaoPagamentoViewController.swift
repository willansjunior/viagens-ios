//
//  ConfirmacaoPagamentoViewController.swift
//  viagens
//
//  Created by Willans Júnior on 27/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {
    
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var labelViagem: UILabel!
    @IBOutlet weak var labelPeriodo: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var botaoVoltarHome: UIButton!
    
    var pacoteConfirmacao:PacoteViagem? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        if let pacote = pacoteConfirmacao {
            self.imagem.image = UIImage(named: pacote.viagem.imagem)
            self.labelViagem.text = pacote.nomeHotel.uppercased()
            self.labelDescricao.text = pacote.descricao
            self.labelQuantidadePessoas.text = pacote.dataViagem
        }
        
        //Arredondando borda da imagem
        self.imagem.layer.cornerRadius = 10
        
        //Adicionando bordas arredondadas do botao
        self.botaoVoltarHome.layer.cornerRadius = 8
        
        self.botaoVoltarHome.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func voltarHome(_ sender: UIButton) {
        if let navigation = navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }

}
