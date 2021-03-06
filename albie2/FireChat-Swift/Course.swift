//
//  Course.swift
//  FireChat-Swift
//
//  Created by Karthik Senthil on 4/5/16.
//  Copyright © 2016 Firebase. All rights reserved.
//

import Foundation

class Course {
    private var name: String!
    private var id: Int!
    
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
}