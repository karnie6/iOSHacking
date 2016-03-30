//
//  ViewController.swift
//  segues
//
//  Created by Karthik Senthil on 3/30/16.
//  Copyright © 2016 Karthik Senthil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://swapi.co/api/people/1"
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        session.dataTaskWithURL(url) { (data: NSData?,
            response: NSURLResponse?, error: NSError?) -> Void in
            if let responseData = data {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    
                    if let dict = json as? Dictionary<String, AnyObject> {
                        if let name = dict["name"] as? String, let height = dict["height"] as? String,
                            let birth = dict["birth_year"] as? String, let hair = dict["hair_color"] as? String {
                            let person = SWPerson(name: name, height: height, birthYear: birth, hairColor: hair)
                            
                            print(person.getName)
                        }
                    }
                    
                    print(json)
                } catch {
                    print("Could not serialize")
                }
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

