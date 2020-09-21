//
//  SignupViewController.swift
//  
//
//  Created by Digital-02 on 9/16/20.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var firstName: UITextField!
    
    
    @IBOutlet weak var lastName: UITextField!
    
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var role: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    
    
    var ref: DatabaseReference!
    
    @IBAction func btnSingUp(_ sender: Any) {
        if let email = email.text, let password = password.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                }else{
                   // self.performSegue(withIdentifier: "signUpSegway", sender:self)
                    
                   let uid = authResult?.user.uid
                    let userFName = self.firstName.text
                    let userLName = self.lastName.text
                    let emailD = self.email.text
                    let roleu = self.role.text
                    
                    
                    
                    self.ref = Database.database().reference()
                    self.ref.child("users").child(uid ?? "").setValue(["username": userFName, "lastName": userLName , "email" : emailD, "roleu" : roleu])
                    
                    self.performSegue(withIdentifier: "signUpSegway", sender:self)
                    
                }
            }
        }
        
        
       
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
