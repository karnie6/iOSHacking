//
//  PokemonDetailVC.swift
//  PokeDex
//
//  Created by Karthik Senthil on 3/31/16.
//  Copyright © 2016 Karthik Senthil. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!    
    
    @IBOutlet weak var testname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testname.text = pokemon.getName

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
