//
//  Pokemon.swift
//  PokeDex
//
//  Created by Karthik Senthil on 3/30/16.
//  Copyright © 2016 Karthik Senthil. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var name: String!
    private var pokedexId: Int!
    private var description: String!
    private var type: String!
    private var defense: String!
    private var height: String!
    private var weight: String!
    private var attack: String!
    private var nextEvolutionText: String!
    
    private var pokemonUrl: String!
    
    var getName: String {
        return self.name
    }
    
    var getPokedexId: Int {
        return self.pokedexId
    }
    
    var getHeight: String {
        return self.height
    }
    
    var getWeight: String {
        return self.weight
    }
    
    var getDefense: String {
        return self.defense
    }
    
    var getAttack: String {
        return self.attack
    }
    
    init(name: String, pokedexId: Int) {
        self.name = name;
        self.pokedexId = pokedexId;
        
        self.pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        Alamofire.request(.GET, pokemonUrl).responseJSON { response in
            let result = response.result
            
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self.weight = weight
                }
                
                if let description = dict["description"] as? String {
                    self.description = description
                }
                
                if let height = dict["height"] as? String {
                    self.height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self.attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self.defense = "\(defense)"
                }
                
                print(self.height)
                print(self.defense)
                
             /*   if let types = dict["types"] as? [Dictionary<String, String>] {
                    
                } */
                
                
                
            }
            
            completed()
        }
    }
}