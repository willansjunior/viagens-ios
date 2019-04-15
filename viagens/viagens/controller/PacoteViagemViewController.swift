//
//  PacoteViagemViewController.swift
//  viagens
//
//  Created by Willans Júnior on 14/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class PacoteViagemViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionPacoteViagem: UICollectionView!
    
    let list:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Informar ao view controller que ele implementa as funcionalidade do dataSource
        collectionPacoteViagem.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let viagem = list[indexPath.row]
        
        celulaPacote.labelTitulo.text = viagem.titulo
        celulaPacote.labelQuantidadeDias.text = "\(viagem.quantidadeDias) dias"
        celulaPacote.labelPreco.text = "R$ \(viagem.preco)"
        celulaPacote.imagemViagem.image = UIImage(named: viagem.imagem)
        
        //tamanho da borda
        celulaPacote.layer.borderWidth = 0.5
        
        //cor para a borda
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        
        //arredondando a borda
        celulaPacote.layer.cornerRadius = 8
        
        return celulaPacote
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
