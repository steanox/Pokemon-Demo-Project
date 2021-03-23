//
//  ViewController.swift
//  Demo-project3
//
//  Created by octavianus on 09/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonAge: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonStatus: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    
    var allPokemons: [Pokemon] = [
       Pokemon(name: "Charmender", age: 1, height: 1.1),
       Pokemon(name: "Burbasaur", age: 1, height: 1.1),
       Pokemon(name: "Squirtle", age: 1, height: 1.1)
    ]
    
    var selectedPokemon: Pokemon!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedPokemon = allPokemons.first
        setupPokemon()
    }
    
    
    func setupPokemon(){
        pokemonName.text = "\(selectedPokemon.name)"
        pokemonAge.text = "\(selectedPokemon.age) Months"
        pokemonHeight.text = "\(selectedPokemon.height) Ft"
        pokemonImage.image = UIImage(named: selectedPokemon.name.lowercased())
        
        
        if selectedPokemon.isReadyToEvolved {
            pokemonStatus.text = "Ready to evolved"
        } else {
            pokemonStatus.text = "Not ready to evolved"
        }
    }
    
    @IBAction func trainPokemon(_ sender: Any) {
        //charmenderAge = charmenderAge + 1
        selectedPokemon.age += 1
        selectedPokemon.height = selectedPokemon.height + 1.1
        
        if selectedPokemon.age > 5{
            selectedPokemon.isReadyToEvolved = true
        }
        
        setupPokemon()
    }
    
    @IBAction func previousPokemon(_ sender: Any) {
        selectedIndex -= 1
        
        if selectedIndex <  0 {
            selectedIndex = allPokemons.count - 1
        }
        
        selectedPokemon = allPokemons[selectedIndex]
        
        
        setupPokemon()
    }
    
    @IBAction func nextPokemon(_ sender: Any) {
        selectedIndex += 1
        
        if selectedIndex > allPokemons.count - 1 {
            selectedIndex = 0
        }
        
        selectedPokemon = allPokemons[selectedIndex] // 2 3
        
        
        setupPokemon()
    }
}



