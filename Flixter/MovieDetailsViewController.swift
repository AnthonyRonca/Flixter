//
//  MovieDetailsViewController.swift
//  Flixter
//
//  Created by Anthony Ronca on 2/7/19.
//  Copyright © 2019 ANTHONY RONCA. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(movie["title"])
        
        
        
        
        
        
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
