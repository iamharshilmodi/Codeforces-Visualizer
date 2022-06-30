//
//  visResController.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

import UIKit

class visResController: UIViewController {
    
    var abtuser = aboutUser()
    var abtcontest = aboutContest()
    var abtproblem = aboutProblem()
    var username = "username"
    
    var prodata = ["rank", "maxRank", "rating", "maxRating", "contribution", "dp"]
    var cntdate = [Date]()
    var cntrating = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        activityView.startAnimating()
//        activityView.hidesWhenStopped = true
        abtuser.delegate = self
        abtcontest.delegate = self
//        abtproblem.delegate = self
        
        abtuser.fetchData(username)
        abtcontest.fetchData(username)
        abtproblem.fetchData(username)
        
    }

}

// MARK: User Data
extension visResController: aboutUserDelegate {
    
    func didUpdateData(_ aboutuser: aboutUser, userdata: userData) {
        
        DispatchQueue.main.async {
        
//            print(userdata)
            self.prodata[0] = userdata.result[0].rank
            self.prodata[1] = userdata.result[0].maxRank
            self.prodata[2] = String(userdata.result[0].rating)
            self.prodata[3] = String(userdata.result[0].maxRating)
            self.prodata[4] = String(userdata.result[0].contribution)
            self.prodata[5] = userdata.result[0].titlePhoto
//            print(self.prodata)
        
        }
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
//            self.errorLabel.text = "User Not Found"
//            self.activityView.stopAnimating()
//            self.tableView.isHidden = true
        }
    }
}

extension visResController: contestDataDelegate {
    
    func didUpdateData(_ aboutcontest: aboutContest, contestdata: contestData) {
        
        for cont in contestdata.result {
            
            let epochTime = TimeInterval(cont.ratingUpdateTimeSeconds)
            let date = Date(timeIntervalSince1970: epochTime)
            
            cntdate.append(date)
            cntrating.append(cont.newRating)
            
        }
        
        for date in cntdate {
            print(date)
        }
        for rating in cntrating {
            print(rating)
        }
        
    }
    
}
