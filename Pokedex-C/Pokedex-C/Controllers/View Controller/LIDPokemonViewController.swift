//
//  LIDPokemonViewController.swift
//  Pokedex-C
//
//  Created by Leonardo Diaz on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class LIDPokemonViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!
    
    
    var pokemon: LIDPokemon?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonSearchBar.delegate = self
    }
}

extension LIDPokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        LIDPokemonController.fetchPokemon(withSearchTerm: searchTerm) { (pokemon) in
            LIDPokemonController.fetchImage(for: pokemon) { (image) in
                DispatchQueue.main.async {
                    self.pokemonImageView.image = image
                    self.pokemonNameLabel.text = pokemon.name
                    self.pokemonIDLabel.text = "ID: \(pokemon.identifier)"
                    self.pokemonAbilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
                }
            }
        }
    }
}
