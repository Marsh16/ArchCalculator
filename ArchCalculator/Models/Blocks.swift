//
//  Blocks.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 29/04/24.
//

import Foundation

struct Block: Codable{
    var type:String
    var length:Double
    var width:Double
    var height:Double
    
    init(type: String, length: Double, width: Double, height: Double) {
        self.type = type
        self.length = length
        self.width = width
        self.height = height
    }
}
