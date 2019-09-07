//
//  SingUpVC.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/6/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit
import CoreData

class SignUpVC : MyVC {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onTap(TheView: self.view)
        
        nameText.becomeFirstResponder()
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        // TODO: delete the if later, this is to avoid multiple unnecessary inserts
        if(emailText.text != "") {
            insertUser()
        }
        openLandingPage()
    }
    
    final private func createUser() {
        let coreDataManager = CoreDataManager(nameOfTheModel: "ChallengeAccepted")
        //let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: coreDataManager.managedObjectContext) as! UserMO
        
        
        do {
            try coreDataManager.managedObjectContext.save()
        } catch {
            
        }
    }
    
    private func insertUser() {
        let myCoreData : MyCoreData = MyCoreData.getInstance
        let user : User  = myCoreData.insert(EntityName: "User") as! User
        
        user.name = nameText.text
        user.email = emailText.text
        
        myCoreData.save()
    }
    
    private func openLandingPage() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "home") as! HomeVC
        self.present(vc, animated: true, completion: nil)
    }
}
