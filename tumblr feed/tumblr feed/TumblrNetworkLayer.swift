//
//  TumblrNetworkLayer.swift
//  tumblr feed
//
//  Created by Kevin Thrailkill on 3/29/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TumblerNetworkLayer {
    
    class func getTumberFeed(completion: @escaping (Bool, [FeedPost]) -> ()) {
        
        let apiKey = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        var posts: [FeedPost] = []
        
        Alamofire.request("https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(apiKey)").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                
                //get the posts and add to feed array
                for (_, json):(String, JSON) in json["response"]["posts"] {
             
                    let post = FeedPost(json: json)
                    posts.append(post)
                    
                }
                
                completion(true, posts)
                
              //  print("JSON: \(json)")
            case .failure(let error):
                print(error)
                
                completion(false, posts)
                
            }
        }
    }
}
