//
//  TresViewController.swift
//  Suggested Cannula Size
//
//  Created by Francisco Barrios Romo on 12-06-17.
//  Copyright © 2017 RentalApps. All rights reserved.
//

import UIKit
import Spring
import FCAlertView

class TresViewController: UIViewController, FCAlertViewDelegate   {
    @IBOutlet var item1: SpringImageView!
    @IBOutlet var item2: SpringImageView!
    @IBOutlet var lblItem1: SpringLabel!
    @IBOutlet var lblItem2: SpringLabel!
    
    @IBOutlet var titulo: UILabel!
    @IBOutlet var btnItem1: UIButton!
    @IBOutlet var btnItem2: UIButton!

    var flagItem1 = false
    var flagItem2 = false
    
    @IBOutlet var footer: UIImageView!
    @IBOutlet var Right: UISwipeGestureRecognizer!
    
    @IBOutlet var btnGo: UIButton!

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
            step3Option["Option"] = lblItem1.text
            
        }else if !flagItem1 && flagItem2 {
            item1.image = UIImage(named: "Shape-ok")
            flagItem1 = true
            item2.image = UIImage(named: "Shape")
            flagItem2 = false
            step3Option["Option"] = lblItem1.text
        }else if flagItem1 && !flagItem2 {
            item1.image = UIImage(named: "Shape")
            flagItem1 = false
            item2.image = UIImage(named: "Shape-ok")
            flagItem2 = true
            step3Option["Option"] = lblItem2.text
        }
    }
    
    @IBAction func btnItem2(_ sender: Any) {
        if !flagItem1 && !flagItem2 {
            item2.image = UIImage(named: "Shape-ok")
            flagItem2 = true
            step3Option["Option"] = lblItem2.text
        }else if !flagItem1 && flagItem2 {
            item1.image = UIImage(named: "Shape-ok")
            flagItem1 = true
            item2.image = UIImage(named: "Shape")
            flagItem2 = false
            step3Option["Option"] = lblItem1.text
        }else if flagItem1 && !flagItem2 {
            item1.image = UIImage(named: "Shape")
            flagItem1 = false
            item2.image = UIImage(named: "Shape-ok")
            flagItem2 = true
            step3Option["Option"] = lblItem2.text
        }
    }
    
    var data = ["WEIGHT": "","HEIGHT": "", "FLOW": ""]
    var step2Option = ["Option": ""]
    var step3Option = ["Option": ""]
    
    var datoCA: [(fr: Int,flowMin: Int, flowMax: Int)] = {
        var values = [(fr: Int,flowMin: Int, flowMax: Int)]()
        
        values.append((fr: 8, flowMin: 1, flowMax:750));
        values.append((fr: 10, flowMin: 751, flowMax:1100));
        values.append((fr: 12, flowMin: 1101, flowMax:1700))
        values.append((fr: 14, flowMin: 1701, flowMax:2200))
        values.append((fr: 15, flowMin: 2201, flowMax:2500))
        values.append((fr: 16, flowMin: 2501, flowMax:3100))
        values.append((fr: 17, flowMin: 3101, flowMax:3500))
        values.append((fr: 18, flowMin: 3501, flowMax:4000))
        values.append((fr: 19, flowMin: 4001, flowMax:4500))
        values.append((fr: 20, flowMin: 4501, flowMax:5000))
        values.append((fr: 21, flowMin: 5001, flowMax:5500))
        values.append((fr: 22, flowMin: 5501, flowMax:6000))
        values.append((fr: 23, flowMin: 6001, flowMax:7000))
        values.append((fr: 24, flowMin: 7001, flowMax:8000))
        
        return values
    }()
    
    
    var datoCV: [(fr: Int,flowMin: Int, flowMax: Int)] = {
        var values = [(fr: Int,flowMin: Int, flowMax: Int)]()
        
        values.append((fr: 8, flowMin: 1, flowMax:500))
        values.append((fr: 10, flowMin: 501, flowMax:750))
        values.append((fr: 12, flowMin: 751, flowMax:1250))
        values.append((fr: 14, flowMin: 1251, flowMax:1500))
        values.append((fr: 15, flowMin: 1501, flowMax:1650))
        values.append((fr: 16, flowMin: 1651, flowMax:1800))
        values.append((fr: 17, flowMin: 1801, flowMax:1900))
        values.append((fr: 18, flowMin: 1901, flowMax:2000))
        values.append((fr: 19, flowMin: 2001, flowMax:2600))
        values.append((fr: 20, flowMin: 2601, flowMax:2900))
        values.append((fr: 21, flowMin: 2901, flowMax:3200))
        values.append((fr: 22, flowMin: 3201, flowMax:3500))
        values.append((fr: 23, flowMin: 3501, flowMax:4000))
        values.append((fr: 24, flowMin: 4001, flowMax:4500))
        values.append((fr: 25, flowMin: 4501, flowMax:5000))
        values.append((fr: 26, flowMin: 5001, flowMax:5500))
        values.append((fr: 27, flowMin: 5501, flowMax:6000))
        values.append((fr: 28, flowMin: 6001, flowMax:7000))
        values.append((fr: 29, flowMin: 7001, flowMax:8000))
        
        return values
    }()
    
    var datoCR: [(fr: Int,flowMin: Int, flowMax: Int)] = {
        var values = [(fr: Int,flowMin: Int, flowMax: Int)]()
        
        values.append((fr: 8, flowMin:	1, flowMax:	750))
        values.append((fr: 10, flowMin:	751, flowMax:1100))
        values.append((fr: 12, flowMin:	1101, flowMax:	1700))
        values.append((fr: 14, flowMin:	1701, flowMax:	2200))
        values.append((fr: 15, flowMin:	2201, flowMax:	2500))
        values.append((fr: 16, flowMin:	2501, flowMax:	3100))
        values.append((fr: 17, flowMin:	3101, flowMax:	3500))
        values.append((fr: 18, flowMin:	3501, flowMax:	4000))
        values.append((fr: 19, flowMin:	4001, flowMax:	4500))
        values.append((fr: 20, flowMin:	4501, flowMax:	5000))
        values.append((fr: 21, flowMin:	5001, flowMax:	5500))
        values.append((fr: 22, flowMin:	5501, flowMax:	6000))
        values.append((fr: 23, flowMin:	6001, flowMax:	7000))
        values.append((fr: 24, flowMin:	7001, flowMax:	8000))
        
        return values
    }()
    
    var datoCVE: [(fr: Int,flowMin: Int, flowMax: Int)] = {
        var values = [(fr: Int,flowMin: Int, flowMax: Int)]()
        
        values.append((fr: 8, flowMin:	1, flowMax:	500))
        values.append((fr: 10, flowMin:	501, flowMax:	750))
        values.append((fr: 12, flowMin:	751, flowMax:	1250))
        values.append((fr: 14, flowMin:	1251, flowMax:	1500))
        values.append((fr: 15, flowMin:	1501, flowMax:	1650))
        values.append((fr: 16, flowMin:	1651, flowMax:	1800))
        values.append((fr: 17, flowMin:	1801, flowMax:	1900))
        values.append((fr: 18, flowMin:	1901, flowMax:	2000))
        values.append((fr: 19, flowMin:	2001, flowMax:	2600))
        values.append((fr: 20, flowMin:	2601, flowMax:	2900))
        values.append((fr: 21, flowMin:	2901, flowMax:	3200))
        values.append((fr: 22, flowMin:	3201, flowMax:	3500))
        values.append((fr: 23, flowMin:	3501, flowMax:	4000))
        values.append((fr: 24, flowMin:	4001, flowMax:	4500))
        values.append((fr: 25, flowMin:	4501, flowMax:	5000))
        values.append((fr: 26, flowMin:	5001, flowMax:	5500))
        values.append((fr: 27, flowMin:	5501, flowMax:	6000))
        values.append((fr: 28, flowMin:	6001, flowMax:	7000))
        values.append((fr: 29, flowMin:	7001, flowMax:	8000))
        
        return values
    }()
    
    var datoCA2: [(fr: Int,flowMin: Int, flowMax: Int)] = {
        var values = [(fr: Int,flowMin: Int, flowMax: Int)]()
        
        values.append((fr: 8, flowMin:	1, flowMax:	750))
        values.append((fr: 10, flowMin:	751, flowMax:	1100))
        values.append((fr: 12, flowMin:	1101, flowMax:	1700))
        values.append((fr: 14, flowMin:	1701, flowMax:	2200))
        values.append((fr: 16, flowMin:	2201, flowMax:	3100))
        values.append((fr: 18, flowMin:	3101, flowMax:	4000))
        values.append((fr: 20, flowMin:	4001, flowMax:	5000))
        values.append((fr: 22, flowMin:	5001, flowMax:	7000))
        values.append((fr: 24, flowMin:	7001, flowMax:	9000))
        
        return values
    }()
    
    
    var datoCVM: [(fr: Int,flowMin: Int, flowMax: Int)] = {
        var values = [(fr: Int,flowMin: Int, flowMax: Int)]()
        
        values.append((fr: 12, flowMin:	1, flowMax:	500))
        values.append((fr: 14, flowMin:	501, flowMax:	750))
        values.append((fr: 16, flowMin:	751, flowMax:	1100))
        values.append((fr: 18, flowMin:	1101, flowMax:	1600))
        values.append((fr: 20, flowMin:	1601, flowMax:	2000))
        values.append((fr: 22, flowMin:	2001, flowMax:	2500))
        values.append((fr: 24, flowMin:	2501, flowMax:	2750))
        values.append((fr: 26, flowMin:	2751, flowMax:	3000))
        values.append((fr: 28, flowMin:	3001, flowMax:	3500))
        values.append((fr: 30, flowMin:	3501, flowMax:	4000))
        values.append((fr: 32, flowMin:	4001, flowMax:	5000))
        values.append((fr: 34, flowMin:	5001, flowMax:	6000))
        values.append((fr: 36, flowMin:	6001, flowMax:	7000))
        
        return values
    }()
    
    var datoDobleLumen: [(fr: Int,flowMin: Int, flowMax: Int)] = {
        var values = [(fr: Int,flowMin: Int, flowMax: Int)]()
        
        values.append((fr: 13, flowMin:	1, flowMax:	600))
        values.append((fr: 16, flowMin:	601, flowMax:	900))
        values.append((fr: 19, flowMin:	901, flowMax:	1400))
        values.append((fr: 20, flowMin:	1401, flowMax:	1700))
        values.append((fr: 23, flowMin:	1701, flowMax:	2300))
        values.append((fr: 27, flowMin:	2301, flowMax:	4000))
        values.append((fr: 31, flowMin:	4001, flowMax:	5000))
        
        return values
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnGo.isHidden = true
        
        self.view.addGestureRecognizer(self.Right)
        
        let Left = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        Left.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(Left)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if step2Option["Option"] == "ECMO VA" {
            lblItem1.text = "PERIPHERAL"
            lblItem2.text = "CENTRAL"
        }else if step2Option["Option"] == "ECMO VV" {
            lblItem1.text = "DOBLE LUMEN"
            lblItem2.text = "2 CANNULA"
        }
        
        iPhoneScreenSizes()
        print("Data: ", data)
        print("Option", step2Option)
    
    }
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                let  flag = checkInputAll()
                
                if flag {
                   success()
                    break
                }else {
                    break
                }
                
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    func caution(){
        let alert = FCAlertView();
        
        alert.showAlert(inView: self,
                        withTitle: "Caution",
                        withSubtitle: "Don´t forget to choose an option.",
                        withCustomImage: nil,
                        withDoneButtonTitle: nil,
                        andButtons: nil)
        alert.makeAlertTypeCaution()
        alert.dismissOnOutsideTouch = true
 
    }
    
    func success(){
        let alert = FCAlertView();
        var bs = Float(0)
        var mensaje = ""
        let valor = Int(data["FLOW"]!)! * Int(data["WEIGHT"]!)!

        bs=BS(weight: Int(data["WEIGHT"]!)!, height: Int(data["HEIGHT"]!)!)
        print("Bs: ", bs)
        if ( step2Option["Option"] == "ECMO VA") {
            
            if ( step3Option["Option"] == "PERIPHERAL") {
                
                print("Valor:", valor )
                let cArterial = findFr(value: valor ,dato: datoCA )
                let cVenosa = findFr(value: valor  ,dato: datoCV )
                print("cArterial:", cArterial )
                print("cVenosa:", cVenosa )
                if cArterial == 0 {
                    mensaje = "Arterial Cannula: " + String(datoCA[datoCA.count-1].fr) + " for FlowMáx:" + String(datoCA[datoCA.count-1].flowMax) + " (ml*Kg/min)"
                }else {
                    mensaje = "Arterial Cannula: " + String(cArterial)
                }
                if cVenosa == 0 {
                    mensaje += "\nVenous Cannula: " + String(datoCV[datoCV.count-1].fr) + " for FlowMáx:" + String(datoCV[datoCV.count-1].flowMax) + " (ml*Kg/min)"
                }else {
                   mensaje += "\nVenous Cannula: " + String(cVenosa)
                }
            }else if ( step3Option["Option"] == "CENTRAL") {
                let cArterial = findFr(value: valor  ,dato: datoCA2 )
                let cVenosaMaleable = findFr(value: valor  ,dato: datoCVM )
                print("cArterial:", cArterial )
                print("cVenosaMaleable:", cVenosaMaleable )
                if cArterial == 0 {
                    mensaje = "Arterial Cannula: " + String(datoCA2[datoCA2.count-1].fr) + " for FlowMáx:" + String(datoCA2[datoCA2.count-1].flowMax) + " (ml*Kg/min)"
                }else {
                    mensaje = "Arterial Cannula: " + String(cArterial)
                }
                if cVenosaMaleable == 0 {
                    mensaje += "\nVenous Malleable Cannula: " + String(datoCVM[datoCVM.count-1].fr) + " for FlowMáx:" + String(datoCVM[datoCVM.count-1].flowMax) + " (ml*Kg/min)"
                }else {
                    mensaje += "\nVenous Malleable Cannula: " + String(cVenosaMaleable)
                }
            }
        }else if ( step2Option["Option"] == "ECMO VV") {
            if ( step3Option["Option"] == "2 CANNULA") {
                let cRetorno = findFr(value: valor  ,dato: datoCR )
                let cVenosaExtraccion = findFr(value: valor  ,dato: datoCVE)
                print("cRetorno:", cRetorno )
                print("cVenosaExtraccion:", cVenosaExtraccion )
                if cRetorno == 0 {
                    mensaje = "Return Cannula: " + String(datoCR[datoCR.count-1].fr) + " for FlowMáx:" + String(datoCR[datoCR.count-1].flowMax) + " (ml*Kg/min)"
                }else {
                    mensaje = "Return Cannula: " + String(cRetorno)
                }
                if cVenosaExtraccion == 0 {
                    mensaje += "\nVenous Extraction Cannula: " + String(datoCVE[datoCVE.count-1].fr) + " for FlowMáx:" + String(datoCVE[datoCVE.count-1].flowMax) + " (ml*Kg/min)"
                }else {
                    mensaje += "\nVenous Extraction Cannula: " + String(cVenosaExtraccion)
                }
            }else if ( step3Option["Option"] == "DOBLE LUMEN") {
                let cDobleLumen = findFr(value: valor  ,dato: datoDobleLumen )
                print("cDobleLumen:", cDobleLumen )
                if cDobleLumen == 0 {
                    mensaje = "Double Lumen Cannula: " + String(datoDobleLumen[datoDobleLumen.count-1].fr) + " for FlowMáx:" + String(datoDobleLumen[datoDobleLumen.count-1].flowMax) + " (ml*Kg/min)"
                }else {
                    mensaje = "Double Lumen Cannula: " + String(cDobleLumen)
                }
            }
        }
        
       mensaje += "\n Body surface (BS): " + String(format: "%.2f",bs)+" (m²)"
      /*   mensaje += "\n WEIGHT: " + data["WEIGHT"]! + " (Kg)"
        mensaje += "\n HEIGHT: " + data["HEIGHT"]! + " (cm)"
        mensaje += "\n FLOW: " + data["FLOW"]! + " (ml/mm)"
        */
        footer.image = UIImage(named: "footerAll")
        alert.delegate = self
        alert.showAlert(inView: self,
                        withTitle: "Success",
                        withSubtitle: mensaje,
                        withCustomImage: nil,
                        withDoneButtonTitle: nil,
                        andButtons:["Finish"])
        alert.makeAlertTypeSuccess()
        alert.dismissOnOutsideTouch = true
        print("Final Datos")
        print("DataStep1: ", data)
        print("OptionStep2", step2Option)
        print("OptionStep3", step3Option)
        
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
    
    func BS(weight: Int, height: Int)-> Float{
        return sqrt((Float(weight)*Float(height))/3600)
    }

    func findFr(value: Int, dato: [(fr: Int,flowMin: Int, flowMax: Int)] )-> Int{
        for index in 0..<dato.count {
            if (value >= dato[index].flowMin) && (value <= dato[index].flowMax) {
                return dato[index].fr
            }
        }
        return 0
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "prev" {
            let vc = segue.destination as! DosViewController
            vc.data = data
            vc.step2Option = step2Option
    
        }
        
    }
    
    
    func fcAlertDoneButtonClicked(_ alertView: FCAlertView){
        print("Btn Aceptar")
        footer.image = UIImage(named: "footer3")
    }
    func fcAlertView(_ alertView: FCAlertView, clickedButtonIndex index: Int, buttonTitle title: String) {
        
        if title == "Finish" {
             print("Btn Finish")
             self.btnGo.sendActions(for: .touchUpInside)
        }
    }
    
}





