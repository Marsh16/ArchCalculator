//
//  NumberFormat.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 04/05/24.
//

import Foundation

func NumberFormat(_ value: String)->String{
    let number = (value as NSString).doubleValue
    let numberFormatter = NumberFormatter()
    numberFormatter.groupingSeparator = ","
    numberFormatter.groupingSize = 3
    numberFormatter.usesGroupingSeparator = true
    numberFormatter.decimalSeparator = "."
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 2
    
    let formattedValue = numberFormatter.string(from: number as NSNumber)!
    return formattedValue
}
