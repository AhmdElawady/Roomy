//
//  API.swift
//  Roomy
//
//  Created by Awady on 7/26/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject {

    class func signIn(email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool)-> Void) {
        
        let url = URLs.signIn
        
        let parameters = [
            "email": email,
            "password": password
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { responses in
                switch responses.result {
                    
                case .failure(let error):
                    print(error)
                    completion(error, false)
                    
                case .success(let value):
                    print(value)
                    
                    let json = JSON(value)
                    
                    if let auth_token = json["auth_token"].string {
                        //save auth_token to UserDefoult
                       helper.saveApiToken(token: auth_token)
                        
                        completion(nil, true)
                    }
                }
        }
    }

    
    class func signUp(name: String, email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool)-> Void) {
        
        let url = URLs.signUp
        
        let parameters = [
            "name" : name,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { responses in
                switch responses.result {
                    
                case .failure(let error):
                    print(error)
                    completion(error, false)
                    
                case .success(let value):
                    print(value)
                    
                    let json = JSON(value)
                    if let auth_token = json["auth_token"].string {
                        
                        helper.saveApiToken(token: auth_token)
                        
                        completion(nil, true)
                    }
                    
                }
        }
    }
}
