//
//  UnoViewController.swift
//  
//
//  Created by Francisco Barrios Romo on 09-06-17.
//
//

import UIKit
import FCAlertView
import AVFoundation

class UnoViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet var titulo: UILabel!
    @IBOutlet var Left: UISwipeGestureRecognizer!

    var alert = FCAlertView()
    var  data = ["WEIGHT": "","HEIGHT": "", "FLOW": ""]

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
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.textField1.delegate = self;
        self.textField2.delegate = self;
        self.textField3.delegate = self;

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.addGestureRecognizer(self.Left)
        textField1.text = "WEIGHT (Kg)"
        textField2.text = "HEIGHT (cm)"
        textField3.text = "FLOW (ml*Kg/min)"
        iPhoneScreenSizes()
        if !((data["WEIGHT"] == "") && (data["HEIGHT"] == "") &&  (data["FLOW"] == "")) {
           textField1.text = data["WEIGHT"]
           textField2.text = data["HEIGHT"]
           textField3.text = data["FLOW"]
        }

    }
    
    func caution(inputData: String){
        alert = FCAlertView()
        alert.showAlert(inView: self,
                        withTitle: "Caution",
                        withSubtitle: inputData + ": Don´t forget to enter the data.",
                        withCustomImage: nil,
                        withDoneButtonTitle: nil,
                        andButtons: nil)
        alert.makeAlertTypeCaution()
        alert.dismissOnOutsideTouch = true
        
    }
    
    func warning(inputData: String, low : Int , High : Int){
        var aux = ""
        
        if inputData == "WEIGHT" {
            aux = inputData + ": Data Out of Range. The range is between \(low) and \(High) (Kg)."
        }else if inputData == "HEIGHT" {
            aux = inputData + ": Data Out of Range. The range is between \(low) and \(High) (cm)."
        }else if inputData == "FLOW" {
            aux = inputData + ": Data Out of Range. The range is between \(low) and \(High) (ml*Kg/min)."
        }else {
         aux = ""
        }
        
        alert = FCAlertView()
        alert.showAlert(inView: self,
                        withTitle: "Warning",
                        withSubtitle: aux,
                        withCustomImage: nil,
                        withDoneButtonTitle: nil,
                        andButtons: nil)
        alert.makeAlertTypeWarning()
        alert.dismissOnOutsideTouch = true
    }
    
    func checkInput1()-> Bool{

        let low = 0
        let high = 250
       
        if Int(textField1.text!) == nil {
            caution(inputData: "WEIGHT")
           return false
        }else if ((Int(textField1.text!)! < low ) || (Int(textField1.text!)! > high)) {
            warning(inputData: "WEIGHT", low: low ,High: high)
            return false
        }else {
            print("data Ok:", true)
            return true
        }
   
    }
    
    func checkInput2()-> Bool{
        
        let low = 0
        let high = 250
        
        if Int(textField2.text!) == nil {
            caution(inputData: "HEIGHT")
            return false
        }else if ((Int(textField2.text!)! < low ) || (Int(textField2.text!)! > high)) {
            warning(inputData: "HEIGHT", low: low ,High: high)
            return false
        }else {
            print("data Ok:", true)
            return true
        }
        
    }
    
    func checkInput3()-> Bool{
        
        let low = 0
        let high = 200
        
        if Int(textField3.text!) == nil {
            caution(inputData: "FLOW")
            return false
        }else if ((Int(textField3.text!)! < low ) || (Int(textField3.text!)! > high)) {
            warning(inputData: "FLOW", low: low ,High: high)
            return false
        }else {
            print("data Ok:", true)
            return true
        }
        
    }
    
    func checkInputAll()-> Bool{
        
        var low = 0
        var high = 250
        var flag1 = false
        var flag2 = false
        var flag3 = false
        
        var aux = textField1.text!
    
        if (aux.contains("(Kg)")) {
            aux = String(aux.characters.dropLast(5))
        }else {
        }
        print("aux1: ", aux)
        if Int(aux) == nil {
            flag1 = false
        }else if ((Int(aux)! < low ) || (Int(aux)! > high)) {
            flag1 = false
        }else {
            flag1 = true
        }
        
        low = 0
        high = 250
        aux = textField2.text!
        
        if (aux.contains("(cm)")) {
            aux = String(aux.characters.dropLast(5))
        }else {
        }
        print("aux2: ", aux)
        print("conversion",Int(aux) ?? "nil")
        if Int(aux) == nil {
            flag2 = false
        }else if ((Int(aux)! < low ) || (Int(aux)! > high)) {
            flag2 = false
        }else {
            flag2 = true
        }
        
        low = 0
        high = 200
        
        aux = textField3.text!
        
        if (aux.contains("(ml*Kg/min)")) {
            aux = String(aux.characters.dropLast(12))
        }else {
        }
        
        print("aux3: ", aux)
        if Int(aux) == nil {
            flag3 = false
        }else if ((Int(aux)! < low ) || (Int(aux)! > high)) {
            flag3 = false
        }else {
            flag3 = true
        }
        
        if flag1 && flag2 && flag3 {
            return true
        }else if !flag1 && flag2 && flag3 {
            caution(inputData: "WEIGHT")
            return false
        }else if flag1 && !flag2 && flag3 {
            caution(inputData: "HEIGHT")
            return false
        }else if flag1 && flag2 && !flag3 {
            caution(inputData: "FLOW")
            return false
        }else if !flag1 && !flag2 && flag3 {
            caution(inputData: "WEIGHT & HEIGHT")
            return false
        }else if !flag1 && flag2 && !flag3 {
            caution(inputData: "WEIGHT & FLOW")
            return false
        }else if flag1 && !flag2 && !flag3 {
            caution(inputData: "HEIGHT & FLOW")
            return false
        }else if !flag1 && !flag2 && !flag3 {
            caution(inputData: "WEIGHT & HEIGHT & FLOW")
            return false
        }else {
            return false
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        print("touch")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let aux = OffsetKeyboard()
        ViewUpanimateMoving(up: true, upValue: aux)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let aux = OffsetKeyboard()
        ViewUpanimateMoving(up: false, upValue: aux)
        if textField == textField1 {
            if checkInput1() {
                print("Data OK")
                data["WEIGHT"] = textField1.text!
                textField1.text! += " (Kg)"
            }else {
                print("Data BAD")
                textField1.text = "WEIGHT (Kg)"
            }
        }else if textField == textField2 {
            if checkInput2() {
                print("Data OK")
                data["HEIGHT"] = textField2.text!
                textField2.text! += " (cm)"
            }else {
                print("Data BAD")
                textField2.text = "HEIGHT (cm)"
            }
        }else if textField == textField3 {
            if checkInput3() {
                print("Data OK")
                data["FLOW"] = textField3.text!
                textField3.text! += " (ml*Kg/min)"
            }else {
                print("Data BAD")
                textField3.text = "FLOW (ml*Kg/min)"
            }
        }
        
        
    }
    func ViewUpanimateMoving (up:Bool, upValue :CGFloat){
        let durationMovement:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -upValue : upValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(durationMovement)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    func OffsetKeyboard()->CGFloat{
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0:
            print("iPhone 3,4")
            return 110
        case 568.0:
            print("iPhone 5")
           return 130
        case 667.0:
            print("iPhone 6")
            return 110
        case 736.0:
            print("iPhone 6+")
            return 110
        default:
            print("not an iPhone")
            return 100
        }
    }
    
    func iPhoneScreenSizes(){
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0:
            print("iPhone 3,4")
            textField1.font = textField1.font?.withSize(14)
            textField2.font = textField2.font?.withSize(14)
            textField3.font = textField3.font?.withSize(14)
            titulo.font = titulo.font.withSize(16)
        case 568.0:
            print("iPhone 5")
            textField1.font = textField1.font?.withSize(14)
            textField2.font = textField2.font?.withSize(14)
            textField3.font = textField3.font?.withSize(14)
            titulo.font = titulo.font.withSize(16)
        case 667.0:
            print("iPhone 6")
            textField1.font = textField1.font?.withSize(16)
            textField2.font = textField2.font?.withSize(16)
            textField3.font = textField3.font?.withSize(16)
            titulo.font = titulo.font.withSize(20)
        case 736.0:
            print("iPhone 6+")
            textField1.font = textField1.font?.withSize(18)
            textField2.font = textField2.font?.withSize(18)
            textField3.font = textField3.font?.withSize(18)
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
            let vc = segue.destination as! DosViewController
            vc.data = data
        }
     
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let  flag = checkInputAll()
        
        if flag {
            return true
        }else {
            return false
        }
    }
    
}

