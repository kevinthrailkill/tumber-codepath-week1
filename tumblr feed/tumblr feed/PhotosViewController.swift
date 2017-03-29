//
//  PhotosViewController.swift
//  tumblr feed
//
//  Created by Kevin Thrailkill on 3/29/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var feedPosts : [FeedPost] = []     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 320
        
        TumblerNetworkLayer.getTumberFeed() {
            shouldReload, feed in
            if(shouldReload) {
                self.feedPosts = feed
                self.tableView.reloadData()
            }
        }
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let vc = segue.destination as! DetailImageViewController
        
        var indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        
        vc.imageViewURL = feedPosts[(indexPath?.row)!].detailImageURL
        
        
        
    }
    

}


extension PhotosViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = feedPosts[indexPath.row]
        
        let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        
        
        let url = URL(string: post.imageURL!)!
        
        postCell.imageView?.af_setImage(withURL: url)
        
        
        return postCell
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated:true)
        
    }
    
    
}
