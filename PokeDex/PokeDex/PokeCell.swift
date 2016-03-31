//
//  PokeCell.swift
//  PokeDex
//
//  Created by Karthik Senthil on 3/30/16.
//  Copyright © 2016 Karthik Senthil. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon;
        self.name.text = self.pokemon.getName.capitalizedString
        
        thumbImage.image = UIImage(named: "\(self.pokemon.getPokedexId)")
        
    }
    
}
