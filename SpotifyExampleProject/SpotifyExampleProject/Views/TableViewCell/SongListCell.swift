//
//  SongListCell.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 07/12/24.
//

import UIKit

class SongListCell: UITableViewCell {
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(titleLabel:String, subtitleLabel:String) {
        self.titleLabel.text = titleLabel
        self.subtitleLabel.text = subtitleLabel
    }
    
    
}
