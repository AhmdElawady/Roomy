//
//  SignUpViewController.swift
//  Roomy
//
//  Created by Awady on 7/26/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        
        guard let name = nameTF.text?.trimmed, !name.isEmpty else { return }
        guard let email = emailTF.text?.trimmed, !email.isEmpty else { return }
        guard let password = passwordTF.text, !password.isEmpty else { return }
        
        API.signUp(name: name, email: email, password: password) { (error: Error?, success: Bool) in
            if success {
                
            }
        }
    }
}
