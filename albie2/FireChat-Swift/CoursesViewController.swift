//
//  CoursesViewController.swift
//  FireChat-Swift
//
//  Created by Karthik Senthil on 4/5/16.
//  Copyright © 2016 Firebase. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var courses: UICollectionView!
    
    var coursesData = [Course]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        courses.delegate = self
        courses.dataSource = self
        
        downloadCourseData()
        print("DONE downloading")
        print(coursesData.count)
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
                        if  let courseName = course["name"] as? String {
                            let newCourse = Course(name: courseName)
                            self.coursesData.append(newCourse)
                            print("Retrieved course \(courseName)")
                            
                            print(self.coursesData.count)
                            //print
                            
                        }
//  var newCourse = Course(name: course["name"])
                        
                       // print(course["name"]!);
                       // let course as? Dictionary<String, AnyObject>
                        
                        

                    
                    
                    }
                    //json.
                 
                    
                }catch {
                    print("Error with Json: \(error)")
                }
            }
            
           // completed()
            self.courses.reloadData()
        }
    
        task.resume()
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CourseCell", forIndexPath: indexPath) as? CourseCell {
            
          //  let course : Course!
            
           // course = coursesData[indexPath.row]
            
                    let course = Course(name: "Test")
            cell.configureCell(course)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
/*    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var poke: Pokemon!
        
        if inSearchMode {
            poke = filteredPokemons[indexPath.row]
        } else {
            poke = pokemons[indexPath.row]
        }
        
        performSegueWithIdentifier("PokemonDetailVC", sender: poke)
        
    } */
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coursesData.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)
    }


}
