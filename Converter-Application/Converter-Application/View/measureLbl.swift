//
//  measureLbl.swift
//  Converter-Application
//
//  Created by Himanshu Churi on 7/29/20.
//  Copyright © 2020 Himanshu Churi. All rights reserved.
//

import UIKit
@IBDesignable

class measureLbl: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func loadOverview(){
        layer.cornerRadius = 10.0
        textAlignment = .center
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

    }
    
    override func prepareForInterfaceBuilder() {
        loadOverview()
    }
    
    override func awakeFromNib() {
           super.awakeFromNib()
           loadOverview()
       }

}
