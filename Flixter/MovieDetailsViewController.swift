//
//  MovieDetailsViewController.swift
//  Flixter
//
//  Created by Anthony Ronca on 2/7/19.
//  Copyright © 2019 ANTHONY RONCA. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var backDropView: UIImageView!
    
    @IBOutlet weak var posterView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        titleLabel.text = movie["title"] as? String
        
        titleLabel.sizeToFit()  //  Commands the text to adjust to available size
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterpath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterpath)
        
        posterView.af_setImage(withURL: posterUrl!)
        
        
        //  Gets the poster image to show for the backDrop
        
        let backDropPath = movie["backdrop_path"] as! String
        let backDropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backDropPath)
        
        backDropView.af_setImage(withURL: backDropUrl!)
        
        
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
