//
//  ViewController.swift
//  MyCurrencyConverter
//
//  Created by MacStudent on 2019-10-30.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    var isFirst = true
    @IBOutlet weak var inputValueTF: UITextField!
    
    @IBOutlet weak var inputValueTF1: UITextField!
    
    @IBOutlet weak var inCurr1: UITextField!
    @IBOutlet weak var inCurr: UITextField!
    
    var myPickerView : UIPickerView!
    
    var pickerData = ["CAD" , "USD" , "INR" , "EURO"]
    var usd = 0.0
    var cad = 0.0
    var inr = 0.0
    var euro = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        inputValueTF.delegate = self
        inputValueTF1.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func pickUp(_ textField : UITextField){
        
        // UIPickerView
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        textField.inputView = self.myPickerView
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == inputValueTF){
            isFirst = true
            self.pickUp(textField)
        }else if(textField == inputValueTF1){
            isFirst = false
            self.pickUp(textField)
        }
        
    }
    
    //MARK:- Button
    @objc func doneClick() {
        inputValueTF.resignFirstResponder()
        inputValueTF1.resignFirstResponder()
    }
    @objc func cancelClick() {
        inputValueTF.resignFirstResponder()
           inputValueTF1.resignFirstResponder()
    }
    
    
}


extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    
    //MARK:- PickerView Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if(isFirst){
            self.inputValueTF.text = pickerData[row]
            
        }
        else{
            self.inputValueTF1.text = pickerData[row]
   
            if(inputValueTF.text == "INR") {
                
                 usd = 0.014
                 cad = 0.019
                 inr = 1
                 euro = 0.013
                
                   var val = ""
                if(pickerData[row] == "INR"){
                    
                                val = inCurr.text!
           
                    self.inCurr1.text = String(val)
                }
                if(pickerData[row] == "CAD"){
                 
                    //scoreLabel.text = NSString(format: "Score: %i", Score) as String
                    val = inCurr.text!
                        //?? "0.0") * cad
                   var result = 0.0
                    result = Double(val)! * Double(cad)
                    self.inCurr1.text =  String(format:"%.2f", result)
                }
                if(pickerData[row] == "EURO"){
                    
                    //scoreLabel.text = NSString(format: "Score: %i", Score) as String
                    val = inCurr.text!
                    //?? "0.0") * cad
                    var result = 0.0
                    result = Double(val)! * Double(euro)
                    self.inCurr1.text = String(format:"%.2f", result)
                }
                if(pickerData[row] == "USD"){
                    
                    //scoreLabel.text = NSString(format: "Score: %i", Score) as String
                    val = inCurr.text!
                    //?? "0.0") * cad
                    var result = 0.0
                    result = Double(val)! * Double(usd)
                    self.inCurr1.text = String(format:"%.2f", result)
                }
            }
            
            
            
            
            if(inputValueTF.text == "CAD"){
                var val = ""
                usd = 0.76
                cad = 1.0
                inr = 54.0
                euro = 0.68
                   var result = 0.0
                if(pickerData[row] == "INR"){
                    
               
                    val = inCurr.text!
                  
                    result = Double(val)! * Double(inr)
                    self.inCurr1.text = String(format:"%.2f", result)
                }
                if(pickerData[row] == "CAD"){
                    
                    
                    
                    val = inCurr.text!
                    
                    self.inCurr1.text = String(val)
                    
                }
                if(pickerData[row] == "EURO"){
                    
                    //scoreLabel.text = NSString(format: "Score: %i", Score) as String
                    val = inCurr.text!
                 
                    result = Double(val)! * Double(euro)
                    self.inCurr1.text = String(format:"%.2f", result)
                }
                if(pickerData[row] == "USD"){
                    
                    //scoreLabel.text = NSString(format: "Score: %i", Score) as String
                    val = inCurr.text!
             
                    result = Double(val)! * Double(usd)
                    self.inCurr1.text = String(format:"%.2f", result)
                }
            }
                
                
                if(inputValueTF.text == "USD"){
                    var val = ""
                    usd = 1.0
                    cad = 1.32
                    inr = 71.06
                    euro = 0.90
                       var result = 0.0
                    
                    if(pickerData[row] == "INR"){
                        
                        val = inCurr.text!
                        //?? "0.0") * cad
                        
                        result = Double(val)! * Double(inr)
                        
                        self.inCurr1.text = String(format:"%.2f", result)
                    }
                    if(pickerData[row] == "CAD"){
                        
                        val = inCurr.text!
                        //?? "0.0") * cad
                        
                        result = Double(val)! * Double(cad)
                        
                        self.inCurr1.text = String(format:"%.2f", result)
                    }
                    if(pickerData[row] == "EURO"){
                        
                        //scoreLabel.text = NSString(format: "Score: %i", Score) as String
                        val = inCurr.text!
                        //?? "0.0") * cad
                     
                        result = Double(val)! * Double(euro)
                  
                        self.inCurr1.text = String(format:"%.2f", result)
                    }
                    if(pickerData[row] == "USD"){
                        
                        
                        val = inCurr.text!
                        
                        self.inCurr1.text = String(val)
                  
                                    }
            }
            
            
                if(inputValueTF.text == "EURO"){
                    var val = ""
                    usd = 1.11
                    cad = 1.46
                    inr = 79.11
                    euro = 1.0
                     var result = 0.0
                    if(pickerData[row] == "INR"){
                        
                        val = inCurr.text!
                        //?? "0.0") * cad
                        
                        result = Double(val)! * Double(inr)
                        
                        self.inCurr1.text = String(format:"%.2f", result)
                    }
                    if(pickerData[row] == "CAD"){
                        
                        val = inCurr.text!
                        //?? "0.0") * cad
                        
                        result = Double(val)! * Double(cad)
                        
                        self.inCurr1.text = String(format:"%.2f", result)
                    }
                    if(pickerData[row] == "EURO"){
                        
                        val = inCurr.text!
                        
                        self.inCurr1.text = String(val)
                    }
                    if(pickerData[row] == "USD"){
                        
                        //scoreLabel.text = NSString(format: "Score: %i", Score) as String
                        val = inCurr.text!
                        //?? "0.0") * cad
                       
                        result = Double(val)! * Double(usd)
                        self.inCurr1.text = String(format:"%.2f", result)
                    }
                    
                    
                }
                
            
            
            
        }
        
    }
        
        
        
        
        
        
    
    
}

