//
//  optionButton.swift
//  Converter-Application
//
//  Created by Himanshu Churi on 7/28/20.
//  Copyright © 2020 Himanshu Churi. All rights reserved.
//

import UIKit
 
@IBDesignable

class optionButton: UITextField {
    
    func customizeView(){
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.15)
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = 10.0
        //layer.borderWidth = 0.5
        
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor : UIColor.white])
                
            attributedPlaceholder = place
            
            textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        }
        
    }
  
    override func prepareForInterfaceBuilder(){
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
