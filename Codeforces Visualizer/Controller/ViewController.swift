//
//  ViewController.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 26/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameOutlet: UITextField!
//    var abtuser = aboutUser()
//    var abtcontest = aboutContest()
//    var abtproblem = aboutProblem()
    
//    var prodata = profileData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        abtuser.delegate = self
        usernameOutlet.delegate = self
    }
    
}

//extension ViewController: aboutUserDelegate {
//
//
//        func didUpdateData(_ aboutuser: aboutUser, userdata: userData) {
//
//            DispatchQueue.main.async {
////        print(userdata)
//                self.prodata.currentRank = userdata.result[0].rank
//                self.prodata.maxRank = userdata.result[0].maxRank
//
//                self.prodata.currentRating = userdata.result[0].rating
//                self.prodata.maxRating = userdata.result[0].maxRating
//
//                self.prodata.username = userdata.result[0].handle
//                self.prodata.contribution = userdata.result[0].contribution
//
//                self.prodata.dp = userdata.result[0].avatar
//
//            }
////        print(profiledata)
//
//    }
//
//    func didFailWithError(error: Error) {
//        print(error)
//    }
//
//
//}

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
//            abtcontest.fetchData(uname)
//            abtuser.fetchData(uname)
//            abtproblem.fetchData(uname)
            self.performSegue(withIdentifier: "visRes", sender: self)
        }
        
        usernameOutlet.text = ""
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if(segue.identifier == "visRes"){
                let displayVC = segue.destination as! visResController
                displayVC.username = usernameOutlet.text!
        }
    }

}


