//
//  ViewController.swift
//  tapper
//
//  Created by Karthik Senthil on 3/29/16.
//  Copyright © 2016 Karthik Senthil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var howManyTaps: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    var numberOfTaps = 0;
    var maxTaps = 0;
    
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } */
    
    
    @IBOutlet weak var tapButton2: UIButton!
        @IBOutlet weak var tapsLabel: UILabel!
    

    @IBAction func onPlayButtonPress(sender:UIButton){
        howManyTaps.hidden = true;
        tapButton2.hidden = false;
        tapsLabel.hidden = false;
        tapsLabel.text = "\(numberOfTaps) Taps";
        maxTaps = Int(howManyTaps.text!)!;
    }
    
    @IBAction func onTap2(sender: AnyObject) {
        numberOfTaps = numberOfTaps + 1;
        tapsLabel.text = "\(numberOfTaps) Taps";
        
        
    }
}

