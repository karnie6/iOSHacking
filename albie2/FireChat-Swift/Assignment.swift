//
//  Assignment.swift
//  Albie
//
//  Created by Karthik Senthil on 4/6/16.
//  Copyright © 2016 Firebase. All rights reserved.
//

import Foundation

class Assignment {

    private var name: String!
    private var id: Int!
    private var description: String!

    var getName: String {
        return self.name
    }

    var getId: Int {
        return self.id
    }

    init(name: String, id: Int) {
        self.name = name;
        self.id = id;
    }
    
    init(name: String, id: Int, description: String) {
        self.name = name;
        self.id = id;
        self.description = description;
    }
}