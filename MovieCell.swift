//
//  MovieCell.swift
//  Flixter
//
//  Created by ANTHONY RONCA on 1/31/19.
//  Copyright © 2019 ANTHONY RONCA. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    
    
    //  Outlet created to hold top label
    
    @IBOutlet weak var titleLzbel: UILabel!
    
    //  Decription label located underneath title
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    //  Poster image in cell
    
    @IBOutlet weak var posterView: UIImageView!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
