//
//  DosViewController.swift
//  Suggested Cannula Size
//
//  Created by Francisco Barrios Romo on 11-06-17.
//  Copyright © 2017 RentalApps. All rights reserved.
//

import UIKit
import FCAlertView


class DosViewController: UIViewController {
    @IBOutlet var item1: UIImageView!
    @IBOutlet var item2: UIImageView!
    @IBOutlet var lblItem1: UILabel!
    @IBOutlet var lblItem2: UILabel!
    @IBOutlet var titulo: UILabel!
    
    @IBOutlet var btnItem1: UIButton!
    @IBOutlet var btnItem2: UIButton!
    
    var flagItem1 = false
    var flagItem2 = false
    var alert = FCAlertView()
    
        
    @IBOutlet var Left: UISwipeGestureRecognizer!
    @IBOutlet var Right: UISwipeGestureRecognizer!
    
    @IBAction func info(_ sender: Any) {
        
        let alert = FCAlertView();
        
        alert.showAlert(inView: self,
                        withTitle: "Suggested Cannula Size: ",
                        withSubtitle: "Considering -40 mmHg in venous side and 80 mm Hg  in arterial pressure drop.",
                        withCustomImage: UIImage(named:"heart"),
                        withDoneButtonTitle: nil,
                        andButtons: nil)
        
        alert.dismissOnOutsideTouch = true
        
    }
    
    
    @IBAction func btnItem1(_ sender: Any) {
        
        if !flagItem1 && !flagItem2 {
             item1.image = UIImage(named: "Shape-ok")
            flagItem1 = true
        }else if !flagItem1 && flagItem2 {
            item1.image = UIImage(named: "Shape-ok")
            flagItem1 = true
            item2.image = UIImage(named: "Shape")
            flagItem2 = false
        }else if flagItem1 && !flagItem2 {
            item1.image = UIImage(named: "Shape")
            flagItem1 = false
            item2.image = UIImage(named: "Shape-ok")
            flagItem2 = true
        }
    }
    
    @IBAction func btnItem2(_ sender: Any) {
        if !flagItem1 && !flagItem2 {
            item2.image = UIImage(named: "Shape-ok")
            flagItem2 = true
        }else if !flagItem1 && flagItem2 {
            item1.image = UIImage(named: "Shape-ok")
            flagItem1 = true
            item2.image = UIImage(named: "Shape")
            flagItem2 = false
        }else if flagItem1 && !flagItem2 {
            item1.image = UIImage(named: "Shape")
            flagItem1 = false
            item2.image = UIImage(named: "Shape-ok")
            flagItem2 = true
        }
    }
    
    var  data = ["WEIGHT": "","HEIGHT": "", "FLOW": ""]
    var step2Option = ["Option": ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(self.Left)
        self.view.addGestureRecognizer(self.Right)

      // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        lblItem1.text = "ECMO VA"
        lblItem2.text = "ECMO VV"
        iPhoneScreenSizes()
        print("Data: ", data)
        if step2Option["Option"] == "ECMO VA" {
            item1.image = UIImage(named: "Shape-ok")
            flagItem1 = true
            item2.image = UIImage(named: "Shape")
            flagItem2 = false
        }else  if step2Option["Option"] == "ECMO VV" {
            item1.image = UIImage(named: "Shape")
            flagItem1 = false
            item2.image = UIImage(named: "Shape-ok")
            flagItem2 = true
        }
        
    }
    func caution(){
        alert = FCAlertView()
        alert.showAlert(inView: self,
                        withTitle: "Caution",
                        withSubtitle: "Don´t forget to choose an option.",
                        withCustomImage: nil,
                        withDoneButtonTitle: nil,
                        andButtons: nil)
        alert.makeAlertTypeCaution()
        alert.dismissOnOutsideTouch = true
        
    }
    func checkInputAll()-> Bool{
        if flagItem1 {
            return true
        }else if flagItem2 {
            return true
        }else {
            caution()
            return false
        }
    }
    
    func iPhoneScreenSizes(){
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0:
            print("iPhone 3,4")
            lblItem1.font = lblItem1.font.withSize(14)
            lblItem2.font = lblItem2.font.withSize(14)
            titulo.font = titulo.font.withSize(16)
        case 568.0:
            print("iPhone 5")
            lblItem1.font = lblItem1.font.withSize(14)
            lblItem2.font = lblItem2.font.withSize(14)
            titulo.font = titulo.font.withSize(16)
            
        case 667.0:
            print("iPhone 6")
            lblItem1.font = lblItem1.font.withSize(16)
            lblItem2.font = lblItem2.font.withSize(16)
            titulo.font = titulo.font.withSize(20)
        case 736.0:
            print("iPhone 6+")
            lblItem1.font = lblItem1.font.withSize(18)
            lblItem2.font = lblItem2.font.withSize(18)
            titulo.font = titulo.font.withSize(24)
        default:
            print("not an iPhone")
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "next" {
            let vc = segue.destination as! TresViewController
            vc.data = data
            if flagItem1{
                vc.step2Option = ["Option": "ECMO VA"]
            }else  if flagItem2{
                vc.step2Option = ["Option": "ECMO VV"]
            }
            
        }else  if segue.identifier == "prev" {
            let vc = segue.destination as! UnoViewController
            vc.data = data
            
        }
        
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "prev" {
            return true
        }
        
        let  flag = checkInputAll()
        
        if flag {
            return true
        }else {
            return false
        }
    }


}
