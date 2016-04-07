//
//  AssignmentsViewController.swift
//  Albie
//
//  Created by Karthik Senthil on 4/6/16.
//  Copyright © 2016 Firebase. All rights reserved.
//

import UIKit

class AssignmentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var course: Course!
    
    @IBOutlet weak var tableView: UITableView!
    
    //var items: [String] = ["We", "Heart", "Swift"]
    var assignments = [Assignment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        downloadAssignmentData();
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.assignments.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            if let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell {
        
                cell.textLabel?.text = self.assignments[indexPath.row].getName
                cell.contentView.layer.borderWidth = 1;
                return cell
            }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    func downloadAssignmentData() {
        let requestURL: NSURL = NSURL(string: "https://tbd-2.acme.instructure.com//api/v1/courses/\(course.getId)/assignments.json?access_token=\(ACCESS_TOKEN)")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                do{
                    let assignmentJson = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments) as? NSMutableArray
                    
                    for assignment in assignmentJson! {
                        
                        if  let assignmentName = assignment["name"] as? String, assignmentId = assignment["id"] as? Int {
                            let newAssignment = Assignment(name: assignmentName, id: assignmentId)
                            self.assignments.append(newAssignment)
                            print("Retrieved assignment \(assignmentName)")
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
