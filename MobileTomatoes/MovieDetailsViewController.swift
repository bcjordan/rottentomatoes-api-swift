//
//  MovieDetailsViewController.swift
//  MobileTomatoes
//
//  Created by Brian Jordan on 2/8/15.
//  Copyright (c) 2015 Brian Jordan. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController, UITableViewDataSource {
    var movie:Movie?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("com.codepath.moviedetailcell") as MovieDetailsTableViewCell
        cell.showDataForMovie(movie!)
        self.navigationItem.title = movie!.title
        return cell
    }
}
