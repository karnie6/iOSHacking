//
//  CoursesViewController.swift
//  FireChat-Swift
//
//  Created by Karthik Senthil on 4/5/16.
//  Copyright © 2016 Firebase. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var courses: UICollectionView!
    
    var coursesData = [Course]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Test Data */
      //  let course = Course(name: "Test")
     //   coursesData.append(course)
    //    let course2 = Course(name: "Test2")
  //      coursesData.append(course2)
        
        self.courses!.delegate = self
        self.courses!.dataSource = self
        
        downloadCourseData()
      //  print("DONE downloading")
//print(coursesData.count)
        // Do any additional setup after loading the view.
    }
    
    //completed: DownloadComplete
    func downloadCourseData() {
        let requestURL: NSURL = NSURL(string: "https://tbd-2.acme.instructure.com//api/v1/courses?access_token=\(ACCESS_TOKEN)")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                do{
                    
                    let coursesJson = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments) as? NSMutableArray
                    //print(json)
                    
                    
                    for course in coursesJson! {
                     
                    //print(course)
                        if  let courseName = course["name"] as? String, courseId = course["id"] as? Int {
                            let newCourse = Course(name: courseName, id: courseId)
                            self.coursesData.append(newCourse)
                            print("Retrieved course \(courseName)")
                            
                            print(self.coursesData.count)
                            //print
                            
                        }
//  var newCourse = Course(name: course["name"])
                        
                       // print(course["name"]!);
                       // let course as? Dictionary<String, AnyObject>
                        
                        

                    
                    
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.courses.reloadData()
                    })
                    
                    //self.courses.reloadData()
                    
                 /*   dispatch_async(dispatch_get_main_queue(), ^{
                        self.collectionView.reloadData()
                        }); */

                    //json.
                 
                    
                }catch {
                    print("Error with Json: \(error)")
                }
            }
            
           // completed()
            
        }
    
        task.resume()
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CourseCell", forIndexPath: indexPath) as? CourseCell {
            
            let course : Course!
            
            course = coursesData[indexPath.row]
            
          //          let course = Course(name: "Test")
            cell.configureCell(course)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var course: Course!
        
        course = coursesData[indexPath.row]
        
        performSegueWithIdentifier("AssignmentSegue", sender: course)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coursesData.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(355, 85)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AssignmentSegue" {
            if let assignmentVC = segue.destinationViewController as? AssignmentsViewController {
                if let course = sender as? Course {
                    assignmentVC.course = course
                }
            }
        }
    }


}
