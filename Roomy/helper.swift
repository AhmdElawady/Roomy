//
//  helper.swift
//  Roomy
//
//  Created by Awady on 7/26/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class helper: NSObject {
    
    // go to home Auto login
    class func restartApp() {
        guard let window = UIApplication.shared.keyWindow else { return }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        var vc: UIViewController
        
        if getAuthToken() == nil {
            // go to auth screen
            vc = storyBoard.instantiateInitialViewController()!
        }else {
            // go to main screen
            vc = storyBoard.instantiateViewController(withIdentifier: "Home")
        }
        window.rootViewController = vc
        
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    class func saveApiToken(token: String) {
        
        let defoult = UserDefaults.standard
        //save auth_token to UserDefoult
        defoult.setValue(token, forKey: "auth_token")
        defoult.synchronize()
        
        restartApp()
    }
    
    class func getAuthToken() -> String? {
        
        let defoult = UserDefaults.standard
        
        return defoult.object(forKey: "auth_token") as? String
    }

}
