//
//  Movie.swift
//  MobileTomatoes
//
//  Created by Brian Jordan on 2/8/15.
//  Copyright (c) 2015 Brian Jordan. All rights reserved.
//

import Foundation

class Movie {
    var title: String?
    var thumbnailURL: String?
    var posterURL: String?
    var synopsis:String?
    var mpaaRating:String?
    var criticScore:NSNumber?
    var audienceScore:NSNumber?
    
    init(jsonObject: NSDictionary) {
        self.title = jsonObject["title"] as NSString
        self.thumbnailURL = jsonObject["posters"]?["thumbnail"] as NSString
        self.synopsis = jsonObject["synopsis"] as NSString
        self.mpaaRating = jsonObject["mpaa_rating"] as NSString
        self.posterURL = self.thumbnailURL!.stringByReplacingOccurrencesOfString("tmb", withString: "ori") as NSString
        
        self.criticScore = jsonObject["ratings"]?["critics_score"] as? NSNumber
        self.audienceScore = jsonObject["ratings"]?["audience_score"] as? NSNumber
    }
}
