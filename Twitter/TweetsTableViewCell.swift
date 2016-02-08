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
    @IBOutlet weak var handleLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    var isRetweet = false
    var isFav = false
    
    @IBOutlet weak var rCountLabel: UILabel!
    @IBOutlet weak var fCountLabel: UILabel!
    
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
            if (tweet.user?.handle != nil) {
                handleLabel.text = "@\(tweet.user!.handle!)"
            }
            if (tweet.isFavorited != nil) {
                if (tweet.isFavorited!) {
                    favoriteButton.tintColor = UIColor.redColor()
                    fCountLabel.textColor = UIColor.redColor()
                }
                else {
                    favoriteButton.tintColor = UIColor.grayColor()
                    fCountLabel.textColor = UIColor.grayColor()
                }
            }
            if (tweet.isRetweeted != nil) {
                if (tweet.isRetweeted!) {
                    retweetButton.tintColor = UIColor.greenColor()
                    rCountLabel.textColor = UIColor.greenColor()
                }
                else {
                    retweetButton.tintColor = UIColor.grayColor()
                    rCountLabel.textColor = UIColor.grayColor()
                }
            }
            if (tweet.retweetCount != nil) {
                rCountLabel.text = "\(tweet.retweetCount!)"
            }
            if (tweet.user?.favoriteCount != nil) {
                fCountLabel.text = "\(tweet.user!.favoriteCount!)"
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
    
    @IBAction func retweetButtonTouched(sender: AnyObject) {
        isRetweet = !isRetweet
        
        if (isRetweet) {
            retweetButton.tintColor = UIColor.greenColor()
            rCountLabel.textColor = UIColor.greenColor()
            if (tweet.retweetCount != nil) {
                tweet.retweetCount = tweet.retweetCount! + 1
            }
            TwitterClient.sharedInstance.retweetMe(tweet.id!)
        }
        else {
            retweetButton.tintColor = UIColor.grayColor()
            rCountLabel.textColor = UIColor.grayColor()
            if (tweet.retweetCount != nil) {
                tweet.retweetCount = tweet.retweetCount! - 1
            }
            TwitterClient.sharedInstance.unRetweetMe(tweet.id!)
        }
    }
    
    @IBAction func favoriteButtonTouched(sender: AnyObject) {
        isFav = !isFav
        
        if (isFav) {
            favoriteButton.tintColor = UIColor.redColor()
            fCountLabel.textColor = UIColor.redColor()
            if (tweet.user?.favoriteCount != nil) {
                tweet.user?.favoriteCount = tweet.user!.favoriteCount! + 1
            }
            TwitterClient.sharedInstance.favoriteMe(tweet.id!)
        }
        else {
            favoriteButton.tintColor = UIColor.grayColor()
            fCountLabel.textColor = UIColor.grayColor()
            if (tweet.user?.favoriteCount != nil) {
                tweet.user?.favoriteCount = tweet.user!.favoriteCount! - 1
            }
            TwitterClient.sharedInstance.unFavoriteMe(tweet.id!)
        }
    }
    
}
