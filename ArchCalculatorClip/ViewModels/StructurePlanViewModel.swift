//
//  StructurePlanViewModel.swift
//  ArchCalculatorClip
//
//  Created by Marsha Likorawung on 04/10/24.
//

import Foundation

//view model hotel
class StructurePlanViewModel: ObservableObject {
    
    @Published var structurePlan = [StructurePlan]()
    @Published var searchText: String = ""
    @Published var text: Int = 0
    
    var filteredStructurePlan: [StructurePlan] {
        guard !searchText.isEmpty else { return structurePlan}
        
        return structurePlan.filter { structurePlan in
            structurePlan.structureName.lowercased().contains(searchText.lowercased())
        }
    }
    
    init(){
        structurePlan = StructurePlan.structurePlanList
    }
}

