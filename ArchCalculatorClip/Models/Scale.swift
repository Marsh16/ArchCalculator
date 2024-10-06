//
//  Scale.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 29/04/24.
//

import Foundation

struct Scale: Codable{
    var type:String
    var larger:Double
    var original:Double
    
    init(type: String, larger: Double, original: Double) {
        self.type = type
        self.larger = larger
        self.original = original
    }
}
