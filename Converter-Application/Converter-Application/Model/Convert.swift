//
//  Convert.swift
//  Converter-Application
//
//  Created by Himanshu Churi on 7/28/20.
//  Copyright © 2020 Himanshu Churi. All rights reserved.
//

import Foundation

class Convert {
    class func frmMileToKm( dist: Double, fromPlace: String) -> Double {
        if fromPlace == "Miles to Kilometers"{
            return (1.60934*dist)
        }
        else
        {
            return (0.621371*dist)

        }
    }
}
