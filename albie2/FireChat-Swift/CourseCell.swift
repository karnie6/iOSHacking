//
//  CourseCell.swift
//  FireChat-Swift
//
//  Created by Karthik Senthil on 4/5/16.
//  Copyright © 2016 Firebase. All rights reserved.
//

import UIKit

class CourseCell: UICollectionViewCell {
    
    var course: Course!
    @IBOutlet weak var courseLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(course: Course) {
        self.course = course;
        self.courseLabel.text = self.course.getName
    }
    
}
