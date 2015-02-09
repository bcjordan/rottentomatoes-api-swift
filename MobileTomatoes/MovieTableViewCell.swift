//
//  MovieTableViewCell.swift
//  MobileTomatoes
//
//  Created by Brian Jordan on 2/8/15.
//  Copyright (c) 2015 Brian Jordan. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieNumber: UILabel!
    
    @IBOutlet weak var criticRating: UILabel!
    
    @IBOutlet weak var audienceRating: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
