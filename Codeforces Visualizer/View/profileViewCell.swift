//
//  profileViewCell.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

import UIKit

class profileViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var rankName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var currentRating: UILabel!
    @IBOutlet weak var maxRating: UILabel!
    @IBOutlet weak var contribution: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
