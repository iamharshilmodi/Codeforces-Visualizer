//
//  visResController.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

import UIKit

class visResController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var abtuser = aboutUser()
    var abtcontest = aboutContest()
    var abtproblem = aboutProblem()
    var username = "harshilcodes"
    
    var prodata = ["rank", "maxRank", "rating", "maxRating", "contribution", "dp"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        abtuser.delegate = self
        
        abtuser.fetchData(username)
        abtcontest.fetchData(username)
        abtproblem.fetchData(username)
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "profileViewCell", bundle: nil), forCellReuseIdentifier: "profileCell")
        
        
        
        tableView.reloadData()
//        print(name)
//        DispatchQueue.main.async {
//            print(self.profiledata)
//        }
        
        // Do any additional setup after loading the view.
    }

}

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
            self.tableView.reloadData()
        
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
    
}

extension visResController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! profileViewCell
    
        DispatchQueue.main.async {
            
            cell.rankName.text = self.prodata[0]
            cell.currentRating.text = self.prodata[2]
            cell.maxRating.text = self.prodata[3]
            cell.userName.text = self.username
            cell.contribution.text = self.prodata[4]

            cell.maxRating.textColor = UIColor (named: self.prodata[1])
            cell.currentRating.textColor = UIColor (named: self.prodata[0])
            cell.rankName.textColor = UIColor (named: self.prodata[0])
            cell.userName.textColor = UIColor (named: self.prodata[0])
//            self.prodata.dp = userdata.result[0].avatar
            
            let url = URL(string: self.prodata[5])
            let data = try? Data(contentsOf: url!)

            if let imageData = data {
                cell.dp.image = UIImage(data: imageData)
                
            }
            
        }
        return cell
    }
    
    
}
