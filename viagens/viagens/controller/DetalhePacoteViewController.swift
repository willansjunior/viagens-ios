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
    @IBOutlet weak var scrollDetalhePacote: UIScrollView!
    @IBOutlet weak var labelData: UITextField!
    
    var pacote:PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(aumentaScroll), name: UIResponder.keyboardWillShowNotification, object: nil)
        
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
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    @objc func aumentaScroll() {
        self.scrollDetalhePacote.contentSize = CGSize(width: self.scrollDetalhePacote.frame.width, height: self.scrollDetalhePacote.frame.height + 320)
    }
    
    @objc func loadDataTextField(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yyyy"
        self.labelData.text = formatter.string(from: sender.date)
    }
    
    @IBAction func txtFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(loadDataTextField(sender:)), for: .valueChanged)
    }
    
    @IBAction func buttonConfirmarCompra(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacoteConfirmacao = pacote
        
        //Carregando proxima tela
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
