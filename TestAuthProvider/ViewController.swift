//
//  ViewController.swift
//  TestAuthProvider
//
//  Created by Deniz on 4/22/19.
//  Copyright © 2019 Deniz. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import MapKit
import GoogleSignIn
import FBSDKLoginKit
import FBSDKCoreKit


//View Controller Button and other Mods

let loginManager:FBSDKLoginManager = FBSDKLoginManager()
var dict : [String : AnyObject]!


class ViewController: UIViewController, FBSDKLoginButtonDelegate{
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    print("Logged Out")
    }
    
   
   func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        _ = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
    
}
    

    @IBOutlet weak var ShopperBTNMods: UIButton!
    @IBOutlet weak var ProviderBTNMods: UIButton!
    
    @IBOutlet weak var IamALabel: UILabel!
    
    @IBOutlet weak var LogoMods: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShopperBTNMods.backgroundColor = UIColor.black
        ShopperBTNMods.layer.cornerRadius = 35
        
        ProviderBTNMods.backgroundColor = UIColor.white
        ProviderBTNMods.layer.cornerRadius = 35
        
        LogoMods.backgroundColor = UIColor.white
        LogoMods.layer.cornerRadius = 60
        
        
        // Do any additional setup after loading the view.
    }

    
    
    
    
    @IBAction func ShooperTapped(_ sender: UIButton) {
        
        let authUIShopper = FUIAuth.defaultAuthUI()
        guard authUIShopper != nil
            else {return}

            
       let loginButton = FBSDKLoginButton()
       loginButton.delegate = self
        
        
        authUIShopper? .delegate = self
        authUIShopper?.providers = [FUIEmailAuth(), FUIAnonymousAuth(),FUIGoogleAuth(),FUIFacebookAuth()]
        
        
        let authViewControllerShopper = authUIShopper!.authViewController()

        present(authViewControllerShopper,animated: true)
        
        if (FBSDKAccessToken.current() != nil) {
            performSegue(withIdentifier: "Maps", sender: self)
        }
        
        
        
            performSegue(withIdentifier: "Maps", sender: self)
        
    }
    
    
    
    @IBAction func LoginTapped(_ sender: UIButton) {
        
        //Get the default auth UI object
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil
            else {
                return
        }
        
        
     authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth(), FUIAnonymousAuth(), FUIGoogleAuth(), FUIFacebookAuth()]
        
        
        let authViewController = authUI!.authViewController()
        
        
        present(authViewController, animated: true, completion: nil)
        
    }
    
}

extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult:
        AuthDataResult?, error: Error?) {
        
        //Check if there was an error
        if error != nil {
            return
        }
        
        //AuthDataResult?.user.uid
        performSegue(withIdentifier: "Maps", sender: self)
        
    }
    
    
}
