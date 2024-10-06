//
//  StructurePlan.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 29/04/24.
//

import Foundation

struct StructurePlan: Identifiable, Codable{
    var id: UUID
    var structureIcon: String
    var structureName: String
    var structureDescription: String
    
    init(id: UUID = UUID(),structureIcon: String, structureName: String, structureDescription: String) {
        self.id = id
        self.structureIcon = structureIcon
        self.structureName = structureName
        self.structureDescription = structureDescription
    }
}

extension StructurePlan{
    static let structurePlanList: [StructurePlan] =
    [
        StructurePlan(
            structureIcon: "Column",
            structureName: "Column",
            structureDescription: "A vertical element, usually a rounded shaft with a capital and a base, which in most cases serves as a support."
        ),
        StructurePlan(
            structureIcon: "Foundation",
            structureName: "Foundation",
            structureDescription: "A detailed architectural drawing that outlines the structure's footing, foundation walls, and any other elements that ensure the building is securely anchored to the ground."
        ),
        StructurePlan(
            structureIcon: "Blocks",
            structureName: "Blocks",
            structureDescription: "Usually shows the siting of buildings as blocks laid out on maps of the surrounding area."
        ),
        StructurePlan(
            structureIcon: "Scale",
            structureName: "Scale",
            structureDescription: "A ratio that compares the size of the representation to the actual size of the project, enabling stakeholders to grasp the project's intricacies."
        ),
        StructurePlan(
            structureIcon: "Roof",
            structureName: "Roof",
            structureDescription: "A scaled drawing or diagram of a proposed roof development containing dimensions of the entire roof structure, including shape, size, design and placement of all materials, ventilation, drainage, slopes, valleys and more."
        )
    ]
}
