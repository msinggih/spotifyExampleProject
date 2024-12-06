//
//  CategoryCollectionCell.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 06/12/24.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setupUI(indexpathrow: Int) {
        categoryLabel.layer.cornerRadius = 15
        categoryLabel.layer.borderColor = UIColor.white.cgColor
        categoryLabel.layer.borderWidth = 1
        if indexpathrow == 0 {
            categoryLabel.text = "Playlist"
        } else {
            categoryLabel.text = "Downloads"
        }
    }
    
}
