//
//  Scale.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 29/04/24.
//

import Foundation

struct Scale: Codable{
    var columnType:String
    var length:Double
    var width:Double
    
    init(columnType: String, length: Double, width: Double) {
        self.columnType = columnType
        self.length = length
        self.width = width
    }
}
