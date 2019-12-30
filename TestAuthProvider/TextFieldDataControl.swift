//
//  TextFieldDataControl.swift
//  TestAuthProvider
//
//  Created by Deniz on 9/24/19.
//  Copyright © 2019 Deniz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class TextFieldDataControl: UIViewController {
    
    var refUsers: DatabaseReference!
    

    @IBOutlet weak var UserName: UITextField!
    
    @IBOutlet weak var UserSkill: UITextField!
    
    @IBOutlet weak var UserStreet: UITextField!
    
    @IBOutlet weak var UserCity: UITextField!
    
    @IBOutlet weak var UserState: UITextField!
    
    @IBOutlet weak var UserZipCode: UITextField!
    
    @IBOutlet weak var UserPhoneNumber: UITextField!
    
    @IBAction func EnterDataButton(_ sender: UIButton) {
        
        addUser()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  FirebaseApp.configure()

        refUsers = Database.database().reference().child("USERS");
    
    }
    

    func addUser(){
        
        let key = refUsers.childByAutoId().key
        
        let user = ["id":key,
                    "UserName": UserName.text! as String,
                    "UserSkill": UserSkill.text! as String,
                    "UserStreet": UserStreet.text! as String,
                    "UserCity": UserCity.text! as String,
                    "UserState": UserState.text! as String,
                    "UserZipCode": UserZipCode.text! as String,
                    "UserPhoneNumber": UserPhoneNumber.text! as String,]
        refUsers.child(key!).setValue(user)
        
    }
    

}
