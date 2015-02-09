//
//  MoviesViewController.swift
//  MobileTomatoes
//
//  Created by Brian Jordan on 2/8/15.
//  Copyright (c) 2015 Brian Jordan. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var errorView: UIView!
    
    var movies: NSArray?
    var rc: UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.errorView.hidden = true
        
        self.rc = UIRefreshControl()
        rc?.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        
        self.tableView.insertSubview(self.rc!, atIndex: 0)
        
        self.fetchRottenTomatoesData()
    }
    
    func onRefresh() {
        self.fetchRottenTomatoesData()
    }
    
    func fetchRottenTomatoesData() {
        var apiKey = ""
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("config", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            // Use your dict here
            apiKey = myDict?["rottenTomatoesApiKey"] as NSString
        }
        
        let rottenTomatoesURLString = "http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=" + apiKey
        let request = NSURLRequest(URL: NSURL(string: rottenTomatoesURLString)!)
        SVProgressHUD.show()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{ (response, data, error) in
            var errorValue: NSError? = nil
            SVProgressHUD.dismiss()
            
            let hadError = error != nil
            self.errorView.hidden = !hadError
            if (hadError) {
                self.rc?.endRefreshing()
                return
            }
            
            let dictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &errorValue) as NSDictionary
            self.movies = dictionary["movies"] as? NSArray
            
            self.tableView.reloadData()
            self.rc?.endRefreshing()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movieRows = self.movies {
            return movieRows.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("com.bcjordan.moviecell") as MovieTableViewCell
        let movieJSON:NSDictionary = self.movies?[indexPath.row] as NSDictionary
        let movie:Movie = Movie(jsonObject: movieJSON)
        
        cell.posterImage.setImageWithURL(NSURL(string: movie.thumbnailURL!))
        cell.descriptionLabel.text? = movie.synopsis!
        cell.ratingLabel.text? = movie.mpaaRating!
        cell.titleLabel.text? = movie.title!
        cell.movieNumber.text? = "#\(indexPath.row + 1)"
        cell.criticRating.text? = "\(movie.criticScore!)%"
        cell.audienceRating.text? = "\(movie.audienceScore!)%"
        return cell
    }
    
    func getmovieURLFromRow(row: Int) -> NSURL {
        let image:NSDictionary = self.movies?[row] as NSDictionary
        let images:NSDictionary = image["images"] as NSDictionary
        let resolution:NSDictionary = images["low_resolution"] as NSDictionary
        let url:NSString = resolution["url"] as NSString
        return NSURL(string: url)!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "com.codepath.detailsegue" {
            let movieDetailsViewController = segue.destinationViewController as MovieDetailsViewController
            let movieDictionary:NSDictionary = self.movies![tableView.indexPathForSelectedRow()!.row] as NSDictionary
            movieDetailsViewController.movie = Movie(jsonObject: movieDictionary)
        }
    }
}
