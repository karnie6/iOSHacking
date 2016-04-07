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
    private var url: String!

    var getName: String {
        return self.name
    }

    var getId: Int {
        return self.id
    }
    
    var getDescription: String {
        return self.description
    }
    
    var getUrl: String {
        return self.url
    }

    init(name: String, id: Int) {
        self.name = name;
        self.id = id;
    }
    
    init(name: String, id: Int, description: String, url: String) {
        self.name = name;
        self.id = id;
        self.description = description;
        self.url = url;
    }
}