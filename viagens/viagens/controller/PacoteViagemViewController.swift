//
//  PacoteViagemViewController.swift
//  viagens
//
//  Created by Willans Júnior on 14/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class PacoteViagemViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate {

    @IBOutlet weak var collectionPacoteViagem: UICollectionView!
    @IBOutlet weak var searchViagens: UISearchBar!
    @IBOutlet weak var labelQuantidadePacotes: UILabel!
    
    let listaCompleta = ViagemDAO().retornaTodasAsViagens()
    var list:Array<Viagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Preenchendo lista
        list = listaCompleta
        
        //Informar ao view controller que ele implementa as funcionalidade do dataSource
        collectionPacoteViagem.dataSource = self
        
        //Informar ao controller que ele ira implementar o delegate
        collectionPacoteViagem.delegate = self
        
        //Informar ao controller que ele ira implementar o searchDelegate
        searchViagens.delegate = self

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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tamanhoCelula = collectionView.bounds.width / 2
        return CGSize(width: tamanhoCelula - 15, height: 160)
    }
    
    //Função para clique de um item da collection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Recupera o storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Recupera a view a partir do storyboard
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhe") as! DetalhePacoteViewController
        
        //Carrega a view
        self.present(controller, animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        list = listaCompleta
        
        //Filtando a lista
        var pacotes = list
        if searchText != "" {
            pacotes = pacotes.filter({ $0.titulo.contains(searchText) })
            list = pacotes
        }
        self.labelQuantidadePacotes.text = atualizaContagem()
        collectionPacoteViagem.reloadData()
    }

    //Atualizador do contador da label da lista de pacotes
    func atualizaContagem() -> String {
        return list.count == 1 ? "1 pacote encontrado" : "\(list.count) pacotes encontrados"
    }
    
}
