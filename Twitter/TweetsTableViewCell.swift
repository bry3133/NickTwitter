//
//  TweetsTableViewCell.swift
//  Twitter
//
//  Created by Nicholas Miller on 2/7/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit

class TweetsTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetTextLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            if (tweet.text != nil) {
                tweetTextLabel.text = tweet.text
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
