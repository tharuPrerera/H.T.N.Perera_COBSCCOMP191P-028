//
//  SurvayViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-02 on 9/16/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class SurvayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
displayDATA()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var imgSurvay: UIImageView!
    
    
    @IBOutlet weak var quizLable: UILabel!
    
    
    @IBOutlet weak var btnyes: UIButton!
    

    @IBOutlet weak var btnNo: UIButton!
    
    let qAndAns = [
    ["Are you having any sympotoms ","No"],
    ["Have you been exposed with crowed places","No"],
    ["have you been unteracted with sick people","No"],
    ["Have you been Traveld last 14 days","No"]
    ]
    
    var queNo = 0
    var total = 0
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func hetServayAns(_ sender: UIButton) {
        let usrAnswer = sender.currentTitle
        let  getAns =  qAndAns[queNo][1]
        
        
      if  getAns == usrAnswer{
           print("write")
           total += 1
           print (total)
       }
       else {
           print("Wrong")
       }
        
        if queNo + 1 < qAndAns.count
        {
            queNo += 1
        }
        
        displayDATA()
    }
    func displayDATA() {
        imgSurvay.image = UIImage(named: "lo\(queNo).png")
        quizLable.text = qAndAns[queNo][0]
    }
    
    @IBAction func okButtenShow(_ sender: Any) {
        
        var status = "Good"
        if total > 2{
            status = "Good"
            
        }
        if total == 2{
            status = "Medium"
            
        }
        if total < 2{
            status = "In Risk"
            
        }
        self.performSegue(withIdentifier: "userDataSeg", sender: status)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destin = segue.destination as? MyMenuViewController{
            if let uData = sender as? String{
                
                destin.selectedDatedData = uData
            }
            
        }
        
    }
    
    
}
