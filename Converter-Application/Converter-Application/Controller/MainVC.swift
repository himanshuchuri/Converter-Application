//
//  ViewController.swift
//  Converter-Application
//
//  Created by Himanshu Churi on 7/11/20.
//  Copyright © 2020 Himanshu Churi. All rights reserved.
//

import UIKit

class MainVC: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource, UITextFieldDelegate {
    
    var optionSelected: String?
    var convList = ["Select an Option","Miles to Kilometers", "Kilometers to Miles"]

    @IBOutlet weak var scrollerView: UITextField!
    
    @IBOutlet weak var textValueField: ValueField!
    @IBOutlet weak var resultField: UITextField!
    
    @IBOutlet weak var lblOne: UILabel!
    @IBOutlet weak var lblTwo: UILabel!
    
    func check(choice: String){
           if (optionSelected == "Miles to Kilometers" || optionSelected == "Kilometers to Miles") {
               textValueField.isEnabled = true
           }
           else{
            textValueField.isEnabled = false
        }
       }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // number of sessions
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return convList.count // number of dropdown items
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) -> String? {
        convList[row] // items
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        optionSelected = convList[row] // selected item
        scrollerView.text = optionSelected
        check(choice: optionSelected!)
        
    }

    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        scrollerView.inputView = pickerView
        
    }
    
    @objc func action(){
                
        view.endEditing(true)
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let buttonDone = UIBarButtonItem( title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([buttonDone], animated: true)
        toolBar.isUserInteractionEnabled = true
        scrollerView.inputAccessoryView = toolBar        
    }
    
        
    @objc func calculate() {
        if let resultTxt = textValueField.text { // id wageTxt and priceTxt is not nill then store value in wageTxt1 and priceTxt1 respectively.
            
            if let result = Double(resultTxt){ // casting string to double
                
                view.endEditing(true)
                resultField.isHidden = false
                
                if optionSelected == "Miles to Kilometers"{
                    lblOne.isHidden = false
                    lblTwo.isHidden = false
                    lblOne.text = "Miles"
                    lblTwo.text = "Kilometers"
                }
                else if optionSelected == "Kilometers to Miles" {
                    lblOne.isHidden = false
                    lblTwo.isHidden = false
                    lblOne.text = "Kilometers"
                    lblTwo.text = "Miles"
                }
                
                resultField.text = "\(Convert.frmMileToKm(dist: result, fromPlace : optionSelected!))"
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
        
        // Do any additional setup after loading the view.
        
        let calcBtn = UIButton( frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 0.9774093032, green: 0.6266118835, blue: 0.1045413549, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal) //this works!!!!
        
        // calcBtn.titleLabel?.text = "Calculate" // Does not work
        
        calcBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        calcBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        textValueField.inputAccessoryView = calcBtn // adds btn when clicked
        
        resultField.isHidden = true
        scrollerView.text = ""
        
        
    }
    
    @IBAction func clrBtn(_ sender: Any) {
        scrollerView.text = ""
        textValueField.text = ""
        resultField.isHidden = true
        lblOne.isHidden = true
        lblTwo.isHidden = true
    }
    
}


