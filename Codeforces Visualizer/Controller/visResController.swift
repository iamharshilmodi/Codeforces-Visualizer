//
//  visResController.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

import UIKit

class visResController: UIViewController{


    @IBOutlet weak var tableView: UITableView!
    
    var profiledata : profileData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "profileViewCell", bundle: nil), forCellReuseIdentifier: "profileCell")
        
//        print(profiledata!)
        // Do any additional setup after loading the view.
    }

}

extension visResController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! profileViewCell
        
        return cell
    }
    
    
}
