//
//  profileViewCell.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

import UIKit

class profileViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var rankName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var currentRating: UILabel!
    @IBOutlet weak var maxRating: UILabel!
    @IBOutlet weak var contribution: UILabel!
    
//    var abtuser = aboutUser()
//    var prodata = profileData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        abtuser.delegate = self
    }

//    func didUpdateData(_ aboutuser: aboutUser, userdata: userData) {
//
//        print("data here")
////        DispatchQueue.main.async {
////        print(userdata)
//
//            self.rankName.text = userdata.result[0].rank
//            self.currentRating.text = String(userdata.result[0].rating)
//            self.maxRating.text = String(userdata.result[0].maxRating)
//            self.userName.text = userdata.result[0].handle
//            self.contribution.text = String(userdata.result[0].contribution)
//
//            self.maxRating.textColor = UIColor (named: userdata.result[0].maxRank)
//            self.currentRating.textColor = UIColor (named: userdata.result[0].rank)
//            self.rankName.textColor = UIColor (named: userdata.result[0].rank)
//            self.userName.textColor = UIColor (named: userdata.result[0].rank)
//            self.prodata.dp = userdata.result[0].avatar
//
////        }
//    }
//
//    func didFailWithError(error: Error) {
//        print(error)
//    }
}
