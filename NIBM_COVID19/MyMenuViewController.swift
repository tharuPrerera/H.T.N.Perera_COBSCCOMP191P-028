//
//  MyMenuViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-02 on 9/17/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase

class MyMenuViewController: UIViewController {
    
    
    
    @IBOutlet weak var status: UIImageView!
    
    
    @IBOutlet weak var statusLable: UILabel!
    
    
    private var _selectedDatedData:String!

    var selectedDatedData: String{
        
        get{
            return _selectedDatedData
        }
        set{
            _selectedDatedData = newValue
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        statusLable.text = _selectedDatedData
        
        if _selectedDatedData == "Good"
        {
            status.image = UIImage(named: "status")
            
        }
        
        else if _selectedDatedData == "Medium"
        {
            status.image = UIImage(named: "status2")
            
        }

        else if _selectedDatedData == "In Risk"
        {
            status.image = UIImage(named: "status3")
            
        }
        // Do any additional setup after loading the view.
        
        let userId = Auth.auth().currentUser?.uid
        
        print(userId as Any)
        
        
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
