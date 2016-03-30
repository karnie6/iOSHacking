//
//  SWPerson.swift
//  segues
//
//  Created by Karthik Senthil on 3/30/16.
//  Copyright © 2016 Karthik Senthil. All rights reserved.
//

import UIKit
import Foundation


class SWPerson: NSObject {
    
    private var name: String!
    private var height: String!
    private var birthYear: String!
    private var hairColor: String!
    
    var getName: String {
        return self.name;
    }
    
    var getHeight: String {
        return self.height;
    }
    
    var getBirthYear: String {
        return self.birthYear;
    }
    
    var getHairColor: String {
        return self.hairColor;
    }
    
    init(name: String, height: String, birthYear: String, hairColor: String) {
        self.name = name;
        self.height = height;
        self.birthYear = birthYear;
        self.hairColor = hairColor;
    }
    

}
