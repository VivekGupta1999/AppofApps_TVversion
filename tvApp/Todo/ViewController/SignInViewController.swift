//
//  SignInViewController.swift
//  Project-AppofApps
//
//  Created by Nikita Paralkar on 2019-12-05.
//  Copyright © 2019 Nikita Paralkar. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate{
        

    
        @IBOutlet var usernameText: UITextField!
        @IBOutlet var passwordText: UITextField!
    
    
    @IBAction func connectBtn(sender : Any){
        
        let password = passwordText.text;
        let username = usernameText.text;
        
        //user detail is retrieved from UserDefaults, where both username and password are saved. 
        var passwordStored = UserDefaults.standard.string(forKey: "password")
         var usernameStored = UserDefaults.standard.string(forKey: "username")
        
        if(usernameStored == username){
            if(passwordStored == password){
                UserDefaults.standard.set(true, forKey: "isUserStored")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        

}
