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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
