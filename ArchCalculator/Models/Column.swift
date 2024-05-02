//
//  Column.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 26/04/24.
//

import Foundation

struct Column: Codable{
    var type:String
    var length:Double
    var width:Double
    var heigth:Double
    var begel:Double
    
    init(type: String, length: Double, width: Double, heigth: Double, begel: Double) {
        self.type = type
        self.length = length
        self.width = width
        self.heigth = heigth
        self.begel = begel
    }
}
