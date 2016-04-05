//
//  CourseCell.swift
//  FireChat-Swift
//
//  Created by Karthik Senthil on 4/5/16.
//  Copyright © 2016 Firebase. All rights reserved.
//

import UIKit

class CourseCell: UICollectionViewCell {
    
    @IBOutlet weak var courseButton: UIButton!
    
    var course: Course!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(course: Course) {
        self.course = course;
        self.courseButton.setTitle(self.course.getName, forState: .Normal)
    }
    
}
