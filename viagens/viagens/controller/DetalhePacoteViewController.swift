//
//  DetalhePacoteViewController.swift
//  viagens
//
//  Created by Willans Júnior on 15/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class DetalhePacoteViewController: UIViewController {

    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPeriodoViagem: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    var pacote:PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detalhePacote = pacote {
            self.imagem.image = UIImage(named: detalhePacote.viagem.imagem)
            self.labelTitulo.text = detalhePacote.viagem.titulo
            self.labelDescricao.text = detalhePacote.descricao
            self.labelQuantidadeDias.text = "\(detalhePacote.viagem.quantidadeDias) dias"
            self.labelPreco.text = detalhePacote.viagem.preco
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
