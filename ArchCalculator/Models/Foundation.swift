//
//  Foundation.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 26/04/24.
//

import Foundation

struct Foundations: Codable{
    var type:String
    var length:Double
    var width:Double
    var height:Double
    var stoneHeight:Double
    
    init(type: String, length: Double, width: Double, height: Double, stoneHeight: Double) {
        self.type = type
        self.length = length
        self.width = width
        self.height = height
        self.stoneHeight = stoneHeight
    }
}
