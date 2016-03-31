//
//  Pokemon.swift
//  PokeDex
//
//  Created by Karthik Senthil on 3/30/16.
//  Copyright © 2016 Karthik Senthil. All rights reserved.
//

import Foundation

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
    
    var getName: String {
        return self.name
    }
    
    var getPokedexId: Int {
        return self.pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self.name = name;
        self.pokedexId = pokedexId;
    }
}