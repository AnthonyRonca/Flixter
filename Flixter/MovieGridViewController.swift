//
//  MovieGridViewController.swift
//  Flixter
//
//  Created by Anthony Ronca on 2/11/19.
//  Copyright © 2019 ANTHONY RONCA. All rights reserved.
//

import UIKit
import AlamofireImage


class MovieGridViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    // View for Grid Cell
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    var movies = [[String:Any]]() // Array declaration

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            
            if let error = error {
                
                print(error.localizedDescription)
                
            } else if let data = data {
                
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
               self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.CollectionView.reloadData()
                
                print(self.movies)
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()
    

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let indexPath = collectionView.indexPath(for: cell)!
        
        let movie = movies[indexPath.item]
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterpath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterpath)
        
        print(posterUrl!)
        
        cell.PosterView.af_setImage(withURL: posterUrl!)
        
        return cell
    }

}
