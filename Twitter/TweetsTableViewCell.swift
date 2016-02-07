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
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetNameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            if (tweet.text != nil) {
                tweetTextLabel.text = tweet.text
            }
            if (tweet.user?.name != nil) {
                tweetNameLabel.text = tweet.user!.name
            }
            if (tweet.user?.profileImageURL != nil) {
                profileImageView.setImageWithURL(NSURL(string: tweet.user!.profileImageURL!)!)
            }
            if (tweet.createdAtString != nil) {
                timeStampLabel.text = "\(tweet.createdAtString!)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageView.layer.cornerRadius = 3
        profileImageView.clipsToBounds = true
        
        tweetNameLabel.preferredMaxLayoutWidth = tweetNameLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tweetNameLabel.preferredMaxLayoutWidth = tweetNameLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
