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
    
    var getName: String {
        return self.name
    }
    
    init(name: String) {
        self.name = name;
    }
}