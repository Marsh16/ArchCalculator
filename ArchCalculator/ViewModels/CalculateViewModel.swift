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
            let result1 = Result(name: "Volume", value: "\(Int(volume))", unit: "m³")
            let result2 = Result(name: "Number of Begels", value: "\(Int(begels))", unit: "pieces")
            let result3 = Result(name: "Reinforcing iron", value: "\(Int(reinforcingIron))", unit: "m")
            results.append(result1)
            results.append(result2)
            results.append(result3)
        }
        return results
    }
}
