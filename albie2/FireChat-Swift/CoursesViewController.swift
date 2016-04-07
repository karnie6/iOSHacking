//
//  CoursesViewController.swift
//  FireChat-Swift
//
//  Created by Karthik Senthil on 4/5/16.
//  Copyright © 2016 Firebase. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //@IBOutlet var courses: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    var coursesData = [Course]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        downloadCourseData()
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
                    
                    for course in coursesJson! {
                        if  let courseName = course["name"] as? String, courseId = course["id"] as? Int {
                            let newCourse = Course(name: courseName, id: courseId)
                            self.coursesData.append(newCourse)
                            print("Retrieved course \(courseName)")
                          //  print(self.coursesData.count)
                        }

                    }
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableView.reloadData()
                    })
                    
                }catch {
                    print("Error with Json: \(error)")
                }
            }
            
           // completed()
            
        }
    
        task.resume()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coursesData.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell {
            
            cell.textLabel?.text = self.coursesData[indexPath.row].getName
            cell.contentView.layer.borderWidth = 1;
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var course: Course!

        course = coursesData[indexPath.row]
        
        performSegueWithIdentifier("AssignmentSegue", sender: course)
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
