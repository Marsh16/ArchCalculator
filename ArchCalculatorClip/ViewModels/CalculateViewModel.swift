//
//  CalculateViewModel.swift
//  ArchCalculatorClip
//
//  Created by Marsha Likorawung on 04/10/24.
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
        }else if(column.type == "Square Column"){
            let heigth = (1/12)*column.length
            let width = (1/2)*heigth
            let dimension = width + 10
            let floor = (1/40)/column.length
            let result1 = Result(name: "Column Dimension", value: "\(dimension)", unit: "m")
            let result2 = Result(name: "Floor Plate Dimensions", value: "\(floor)", unit: "m")
            let result3 = Result(name: "Block Heigth", value: "\(heigth)", unit: "m")
            let result4 = Result(name: "Block Width", value: "\(width)", unit: "m")
            results = [result1, result2, result3, result4]
        }
        return results
    }
    
    func calculateFoundation(foundation: Foundations)->[Result]{
        var results : [Result] = []
        if(foundation.type == "River Stone Foundation"){
            let soilExcavation = foundation.length * foundation.width * foundation.height
            let aanstamping = foundation.length * foundation.width * foundation.stoneHeight
            let totalExcavationBy3 = soilExcavation/3
            let result1 = Result(name: "Soil Excavation", value: "\(soilExcavation)", unit: "m³")
            let result2 = Result(name: "Empty Stone Couple (Aanstamping)", value: "\(aanstamping)", unit: "m³")
            let result3 = Result(name: "Total Excavation Volume Shared 3", value: "\(totalExcavationBy3)", unit: "m³")
            results = [result1, result2, result3]
        }else if(foundation.type == "Pile Foundation"){
            let area = foundation.length * foundation.width
            let strength = foundation.height * area
            let capacity = (area * foundation.stoneHeight)/3
            let result1 = Result(name: "Area of the pile", value: "\(area)", unit: "m³")
            let result2 = Result(name: "Permissible Strength in Piles", value: "\(strength)", unit: "kg")
            let result3 = Result(name: "Bearing Capacity of Pile Balance", value: "\(capacity)", unit: "kg")
            results = [result1, result2, result3]
        }else if(foundation.type == "Bore Pile Foundation"){
            let pi = 3.14
            let r = foundation.height/2
            let d = 2*(22/7)*r
            let length = sqrt((pi*(foundation.length/foundation.width)*d)*(pi*(foundation.length/foundation.width)*d) + (foundation.length)*(foundation.length))
            let result1 = Result(name: "Length of Iron Spiral", value: "\(length)", unit: "m")
            results = [result1]
        }
        return results
    }
    
    func calculateRoof(roof: Roof)->[Result]{
        var results : [Result] = []
        if(roof.type == "Gable Roof"){
            let area = Double((roof.length * roof.width)/2)
            let result1 = Result(name: "Area", value: "\(area)", unit: "m²")
            results = [result1]
        }else if(roof.type == "Flat House Roof"){
            let area = (roof.length * roof.width)
            let result1 = Result(name: "Area", value: "\(area)", unit: "m²")
            results = [result1]
        }else if(roof.type == "Curved Roof"){
            let spanRatio = (roof.length/roof.width)
            let result1 = Result(name: "Span Ratio", value: "\(spanRatio)", unit: "m")
            results = [result1]
        }else if(roof.type == "Hipped Roof"){
            let lcr = roof.length/cos(roof.width)
            let lh = lcr * sin(roof.width)
            let area = 2 * lh * lcr
            let result1 = Result(name: "Length of the Common Rafter", value: "\(lcr)", unit: "m")
            let result2 = Result(name: "Length of the Hip", value: "\(lh)", unit: "m")
            let result3 = Result(name: "Area", value: "\(area)", unit: "m²")
            results = [result1, result2, result3]
        }
        return results
    }
    
    func calculateBlocks(block: Block)->[Result]{
        var results : [Result] = []
        if(block.type == "Mortar Concrete"){
            let volume = block.length * block.width * block.height
            let weight = 2200 * volume
            let result1 = Result(name: "Volume", value: "\(volume)", unit: "m³")
            let result2 = Result(name: "Concrete Weight", value: "\(weight)", unit: "kg")
            let result3 = Result(name: "Specific Gravity", value: "\(2200)", unit: "kg/m³")
            results = [result1, result2, result3]
        }else if (block.type == "Reinforced Concrete"){
            let volume = block.length * block.width * block.height
            let weight = 2400 * volume
            let result1 = Result(name: "Volume", value: "\(volume)", unit: "m³")
            let result2 = Result(name: "Concrete Weight", value: "\(weight)", unit: "kg")
            let result3 = Result(name: "Specific Gravity", value: "\(2400)", unit: "kg/m³")
            results = [result1, result2, result3]
        }else if (block.type == "Sand Concrete"){
            let volume = block.length * block.width * block.height
            let weight = 1400 * volume
            let result1 = Result(name: "Volume", value: "\(volume)", unit: "m³")
            let result2 = Result(name: "Concrete Weight", value: "\(weight)", unit: "kg")
            let result3 = Result(name: "Specific Gravity", value: "\(1400)", unit: "kg/m³")
            results = [result1, result2, result3]
        }else if (block.type == "Solid Marble"){
            let volume = block.length * block.width * block.height
            let weight = 2563 * volume
            let result1 = Result(name: "Volume", value: "\(volume)", unit: "m³")
            let result2 = Result(name: "Concrete Weight", value: "\(weight)", unit: "kg")
            let result3 = Result(name: "Specific Gravity", value: "\(2563)", unit: "kg/m³")
            results = [result1, result2, result3]
        }else if (block.type == "Solid Gypsum"){
            let volume = block.length * block.width * block.height
            let weight = 2787 * volume
            let result1 = Result(name: "Volume", value: "\(volume)", unit: "m³")
            let result2 = Result(name: "Concrete Weight", value: "\(weight)", unit: "kg")
            let result3 = Result(name: "Specific Gravity", value: "\(2787)", unit: "kg/m³")
            results = [result1, result2, result3]
        }
        return results
    }
    
    func calculateScale(scale: Scale)->[Result]{
        var results : [Result] = []
        if(scale.type == "Scale Up"){
            let scale = scale.larger/scale.original
            let result1 = Result(name: "Scale", value: "\(scale)", unit: "m")
            results = [result1]
        } else if(scale.type == "Scale Down"){
            let scale = scale.original/scale.larger
            let result1 = Result(name: "Scale", value: "1 : \(scale)", unit: "m")
            results = [result1]
        }
        return results
    }
}
