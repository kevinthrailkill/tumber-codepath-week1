//
//  FeedPost.swift
//  tumblr feed
//
//  Created by Kevin Thrailkill on 3/29/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import Foundation
import SwiftyJSON


class FeedPost {
    
    let imageURL: String?
    let detailImageURL: String?
    
    
    init(json: JSON) {
        
    
        imageURL = json["photos"][0]["alt_sizes"][1]["url"].string
        detailImageURL = json["photos"][0]["original_size"]["url"].string
        
       // print(json)
        
        
        
    }
    
    
    
    
    
    
    
}
