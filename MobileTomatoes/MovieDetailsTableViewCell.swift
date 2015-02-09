//
//  MovieDetailsTableViewCell.swift
//  MobileTomatoes
//
//  Created by Brian Jordan on 2/8/15.
//  Copyright (c) 2015 Brian Jordan. All rights reserved.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    @IBOutlet weak var audienceRatingLabel: UILabel!
    @IBOutlet weak var mpaaRating: UILabel!
    @IBOutlet weak var criticsRatingLabel: UILabel!
    func showDataForMovie(movie:Movie) {
        let detailURL = NSURL(string: movie.posterURL!)!
        self.moviePosterImage.setImageWithURL(detailURL)
        self.movieDescriptionLabel.text = movie.synopsis!
        self.audienceRatingLabel.text = "\(movie.audienceScore!)%"
        self.criticsRatingLabel.text = "\(movie.criticScore!)%"
        self.mpaaRating.text = movie.mpaaRating!
    }
}
