//
//  ViewController.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 26/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameOutlet: UITextField!


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
        
        if usernameOutlet.text != nil {

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
