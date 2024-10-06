//
//  Result.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 30/04/24.
//

import Foundation

//Result model
struct Result: Identifiable,Codable{
    var id: UUID
    var name:String
    var value:String
    var unit:String
    
    init(id: UUID = UUID(),name: String, value: String, unit: String) {
        self.id = id
        self.name = name
        self.value = value
        self.unit = unit
    }
}
