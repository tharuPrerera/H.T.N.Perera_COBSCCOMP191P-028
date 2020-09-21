//
//  ProfileViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-02 on 9/18/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase



class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profilePho: UIImageView!
    
    
    @IBOutlet weak var fname: UILabel!
    
    
    @IBOutlet weak var lname: UILabel!
    
    
    @IBOutlet weak var EmailData: UILabel!
    
    
    @IBOutlet weak var Roleuser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var ref: DatabaseReference!
        
        // Do any additional setup after loading the view.
          ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            //let value = snapshot.value as? NSDictionary
            if let user = snapshot.value as? [String : String ]{
                
                print(user)
                self.fname.text = user["username"]!
                self.lname.text = user["lastName"]
                self.EmailData.text = user["email"]
                self.Roleuser.text = user["roleu"]
                
                
            }
           // self.fname.text = username
       
        }) { (error) in
            print(error.localizedDescription)
        }
    
    
    
    }
    
    @IBAction func buttenLogoutPressed(_ sender: UIButton) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popViewController(animated: true)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
    }
    
    
    @IBAction func backButten(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
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
