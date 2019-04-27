//
//  ViewController.swift
//  viagens
//
//  Created by Willans Júnior on 08/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabelaViagens: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    
    let list:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        
        //Deixa o botão com as bordas arredondadas
        self.viewHoteis.layer.cornerRadius = 10
        self.viewPacotes.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Verificando o dispositivo para setar o tamanho da cell
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cellViagens é o identificador da TableCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellViagens", for: indexPath) as! TableViewCell
        let viagem = list[indexPath.row]
        cell.configCell(viagem)
        
//        cell.textLabel?.text = viagem.titulo
        
        return cell
    }

}

