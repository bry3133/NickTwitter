//
//  Tweet.swift
//  Twitter
//
//  Created by Nicholas Miller on 2/7/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var id: String?
    var isFavorited: Bool?
    var isRetweeted: Bool?
    var retweetCount: Int?
    
    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        formatter.dateStyle = .ShortStyle
        createdAtString = formatter.stringFromDate(createdAt!)
        
        id = dictionary["id_str"] as? String
        
        isFavorited = dictionary["favorited"] as? Bool
        isRetweeted = dictionary["retweeted"] as? Bool
        
        retweetCount = dictionary["retweet_count"] as? Int
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        
        return tweets
    }
}
