//
//  DetailImageViewController.swift
//  tumblr feed
//
//  Created by Kevin Thrailkill on 3/29/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailImageViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    var imageViewURL : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: imageViewURL!)!
        
        detailImageView.af_setImage(withURL: url)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
