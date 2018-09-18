//
//  PokeSearchViewController.swift
//  PokeDexC
//
//  Created by Xavier on 9/18/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class PokeSearchViewController: UIViewController {
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var pokemon: XWPokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchBar.delegate = self
    }
    
        func updateView(){
            guard let pokemon = self.pokemon else {return}
            nameLabel.text = pokemon.name
            idLabel.text = "ID: \(pokemon.identifier)"
            abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
        }
        


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PokeSearchViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {return}
        XWPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            guard let pokemon = pokemon else {return}
            DispatchQueue.main.async {
                self.pokemon = pokemon
                self.updateView()
            }

        }
    }
}
