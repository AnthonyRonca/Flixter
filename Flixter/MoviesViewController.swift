//
//  MoviesViewController.swift
//  Flixter
//
//  Created by ANTHONY RONCA on 1/31/19.
//  Copyright © 2019 ANTHONY RONCA. All rights reserved.
//

import UIKit
import AlamofireImage



class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    

    var movies = [[String:Any]]() // Array declaration
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 280
        
        

        // Do any additional setup after loading the view.
      //  print("THIS VIEW HAS BEEN LOADED FOR THE END OF //TIME")
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.tableView.reloadData()
                
                print(dataDictionary)
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell")  as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        cell.titleLzbel.text = title
        cell.synopsisLabel.text = synopsis
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterpath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterpath)
        
        print(posterUrl!)
        
        cell.posterView.af_setImage(withURL: posterUrl!)
        
         
        
        
        
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        print("Loading...")
        
        // determine which movie has been selected
        
        let cell = sender as! UITableViewCell  //
        
        let indexPath = tableView.indexPath(for: cell)!
        
        let movie = movies[indexPath.row]
        
        
        
        // Pass the selected movie to the detailsViewController
        
        //segue parameter
        
        let detailsViewController = segue.destination as! MovieDetailsViewController
        
        detailsViewController.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
        
//        let detailsViewController = segue.destination as! MoviesViewController
//
//        detailsViewController.movie = movie
        
        
    }
    

}



/*
 
    CodePath IOS Development Notes 2/7/19
 
  - Navigation controller is the method for deciding where the app starts and how it moves throughout
 
  - Cell Recycling refers to the method of re-using cells in otder to display a tableView. It is important to
    understand that a scrolling app uses the same recycable cells rather than creating new memory for each item
 
 - uses the syntax swqueueREsusableCell(withIdentifier:for:)
 
 - Why use push navifation versus Modal, and Tab?
        MODAL: When you transition to an unrelated screen (EX: Login, Registration)
         PUSH: Where you're using a chain which you can either go foreward or back out of
     Nav Tabs: Allows you to select using an icon on the tab bar
 
 
 There is the ability for custom navigation from the developer
 
 Collection View: Gives user a view of multiple items in a single bundle/screen
 
    - is a GRID and can have many different layouts in that manner
    - This is unnessecry but i need to re-push to github
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */
