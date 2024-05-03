//
//  CalculateViewModel.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 29/04/24.
//

import Foundation

class CalculateViewModel: ObservableObject {
    @Published var column = [Column]()
    @Published var blocks = [Block]()
    @Published var foundation = [Foundations]()
    @Published var scale = [Scale]()
    @Published var roof = [Roof]()
    
    func calculateColumn(column: Column)->[Result]{
        var results : [Result] = []
        if(column.type == "Practical Column"){
            let volume = column.length * column.width * column.height
            let begels = (column.length*100)/column.begel
            let reinforcingIron = (column.length)*4
            let result1 = Result(name: "Volume", value: "\(volume)", unit: "m³")
            let result2 = Result(name: "Number of Begels", value: "\(begels)", unit: "pieces")
            let result3 = Result(name: "Reinforcing iron", value: "\(reinforcingIron)", unit: "m")
            results = [result1, result2, result3]
        }
        return results
    }
    
    func calculateFoundation(foundation: Foundations)->[Result]{
        var results : [Result] = []
        if(foundation.type == "River Stone Foundation"){
            let SoilExcavation = foundation.length * foundation.width * foundation.height
            let Aanstamping = foundation.length * foundation.width * foundation.stoneHeight
            let totalExcavationBy3 = SoilExcavation/3
            let result1 = Result(name: "Soil Excavation", value: "\(SoilExcavation)", unit: "m³")
            let result2 = Result(name: "Empty Stone Couple (Aanstamping)", value: "\(Aanstamping)", unit: "m³")
            let result3 = Result(name: "Total Excavation Volume Shared 3", value: "\(totalExcavationBy3)", unit: "m³")
            results = [result1, result2, result3]
        }
        return results
    }
    
    func calculateRoof(roof: Roof)->[Result]{
        var results : [Result] = []
        if(roof.type == "Gable Roof"){
            let Area = Double((roof.length * roof.width)/2)
            let result1 = Result(name: "Area", value: "\(Area)", unit: "m²")
            results = [result1]
        }else if(roof.type == "Flat House Roof"){
            let Area = (roof.length * roof.width)
            let result1 = Result(name: "Area", value: "\(Area)", unit: "m²")
            results = [result1]
        }else if(roof.type == "Curved Roof"){
            let spanRatio = (roof.length/roof.width)
            let result1 = Result(name: "Span Ratio", value: "\(spanRatio)", unit: "m")
            results = [result1]
        }
        return results
    }
    
    func calculateBlocks(block: Block)->[Result]{
        var results : [Result] = []
        if(block.type == "Mortar Concrete"){
            let weight = 0.06165 * block.diameter * block.diameter * block.length
            let result1 = Result(name: "Soil Excavation", value: "\(weight)", unit: "m³")
            results = [result1]
        }else if (block.type == "Reinforced Concrete"){
            
        }
        return results
    }
}
