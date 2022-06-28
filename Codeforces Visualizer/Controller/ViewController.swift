//
//  ViewController.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 26/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameOutlet: UITextField!
    var abtuser = aboutUser()
    var abtcontest = aboutContest()
    var abtproblem = aboutProblem()
    
    var profiledata : profileData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        abtuser.delegate = self
        usernameOutlet.delegate = self
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton){
        usernameOutlet.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameOutlet.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let uname = usernameOutlet.text {
            abtcontest.fetchData(uname)
            abtuser.fetchData(uname)
            abtproblem.fetchData(uname)
            self.performSegue(withIdentifier: "visRes", sender: self)
        }
        
        usernameOutlet.text = ""
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "visRes" {
            if let destVC = segue.destination as? UINavigationController,
                let targetController = destVC.topViewController as? visResController {
                targetController.profiledata = profiledata
            }
        }
    }
}

extension ViewController: aboutUserDelegate {
    
    func didUpdateData(_ aboutuser: aboutUser, userdata: userData) {
        
        print(userdata)
        profiledata?.currentRank = userdata.result[0].rank
        profiledata?.maxRank = userdata.result[0].maxRank

        profiledata?.currentRating = userdata.result[0].rating
        profiledata?.maxRating = userdata.result[0].maxRating

        profiledata?.username = userdata.result[0].handle
        profiledata?.contribution = userdata.result[0].contribution

        profiledata?.dp = userdata.result[0].avatar
        
//        print(profiledata!)
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}


