//
//  Blocks.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 29/04/24.
//

import Foundation

struct Block: Codable{
    var type:String
    var diameter:Double
    var length:Double
    
    init(type: String, diameter: Double, length: Double) {
        self.type = type
        self.diameter = diameter
        self.length = length
    }
}
