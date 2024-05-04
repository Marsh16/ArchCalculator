//
//  CalculateView.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 29/04/24.
//

import SwiftUI

struct CalculateView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var chosenStructure : StructurePlan
    @EnvironmentObject var calculateViewModel: CalculateViewModel
    @State var columnCount:[String] = ["","","",""]
    @State var foundationCount:[String] = ["","","",""]
    @State var roofCount:[String] = ["",""]
    @State var blocksCount:[String] = ["","",""]
    @State var scaleCount:[String] = ["",""]
    @State var result:[Result] = []
    @State var selectionColumn: String = "Practical Column"
    @State var selectionFoundation: String = "River Stone Foundation"
    @State var selectionRoof: String = "Gable Roof"
    @State var selectionScale: String = "Scale Up"
    @State var selectionBlocks: String = "Mortar Concrete"
    @State var columnType:[String] = ["Practical Column", "Square Column"]
    @State var columnParameter:[String] = ["Length","Width", "Height", "Begel"]
    @State var foundationParameter:[String] = ["Length","Width", "Height", "Empty Stone Height"]
    @State var foundationType:[String] = ["River Stone Foundation","Pile Foundation", "Bore Pile Foundation"]
    @State var blocksType:[String] = ["Mortar Concrete","Reinforced Concrete", "Sand Concrete", "Solid Marble", "Solid Gypsum"]
    @State var blocksParameter:[String] = ["Length","Width", "Height"]
    @State var scaleType:[String] = ["Scale Up","Scale Down"]
    @State var scaleParameter:[String] = ["Large Value","Original Value"]
    @State var roofType:[String] = ["Gable Roof","Flat House Roof", "Curved Roof", "Hipped Roof"]
    @State var roofParameter:[String] = ["Length","Width"]
    var body: some View {
        NavigationStack {
            VStack{
                Spacer().navigationBarTitleDisplayMode(.inline).navigationTitle(chosenStructure.structureName)
                Form {
                    Section{
                        if(chosenStructure.structureName == "Column") {
                            Picker("Column Type", selection: $selectionColumn){
                                ForEach(columnType, id: \.self) {
                                    Text($0)
                                }
                            }.multilineTextAlignment(.trailing)
                        } else if(chosenStructure.structureName == "Foundation") {
                            Picker("Foundation Type", selection: $selectionFoundation){
                                ForEach(foundationType, id: \.self) {
                                    Text($0)
                                }
                            }.multilineTextAlignment(.trailing)
                        }else if(chosenStructure.structureName == "Blocks") {
                            Picker("Blocks Type", selection: $selectionBlocks){
                                ForEach(blocksType, id: \.self) {
                                    Text($0)
                                }
                            }.multilineTextAlignment(.trailing)
                        }else if(chosenStructure.structureName == "Scale") {
                            Picker("Scale Type", selection: $selectionScale){
                                ForEach(scaleType, id: \.self) {
                                    Text($0)
                                }
                            }.multilineTextAlignment(.trailing)
                        }else {
                            Picker("Roof Type", selection: $selectionRoof){
                                ForEach(roofType, id: \.self) {
                                    Text($0).tag($0)
                                }
                            }.multilineTextAlignment(.trailing)
                        }
                        
                        if(chosenStructure.structureName == "Column") {
                            if (selectionColumn == "Square Column"){
                                HStack{
                                    Text(columnParameter[0])
                                    TextField(columnParameter[0] + " in m", text:$columnCount[0]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!columnCount[0].isEmpty){
                                        Text("m")
                                    }
                                }
                            }else{
                                HStack{
                                    Text(columnParameter[0])
                                    TextField(columnParameter[0] + " in m", text:$columnCount[0]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!columnCount[0].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text(columnParameter[1])
                                    TextField(columnParameter[1] + " in m", text:$columnCount[1]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!columnCount[1].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text(columnParameter[2])
                                    TextField(columnParameter[2] + " in m", text:$columnCount[2]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!columnCount[2].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text(columnParameter[3])
                                    TextField(columnParameter[3] + " in cm", text:$columnCount[3]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!columnCount[3].isEmpty){
                                        Text("cm")
                                    }
                                }
                            }
                        }else if(chosenStructure.structureName == "Foundation"){
                            if (selectionFoundation == "Pile Foundation"){
                                HStack{
                                    Text(foundationParameter[0])
                                    TextField(foundationParameter[0] + " in m", text:$foundationCount[0]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[0].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text(foundationParameter[1])
                                    TextField(foundationParameter[1] + " in m", text:$foundationCount[1]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[1].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text("Material Pressure")
                                    TextField("Material Pressure in kg/m³", text:$foundationCount[2]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[2].isEmpty){
                                        Text("kg/m³")
                                    }
                                }
                                HStack{
                                    Text("Cone Value")
                                    TextField("Cone Value in kg/m³", text:$foundationCount[3]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[3].isEmpty){
                                        Text("kg/m³")
                                    }
                                }
                            }else if (selectionFoundation == "Bore Pile Foundation"){
                                HStack{
                                    Text(foundationParameter[0])
                                    TextField(foundationParameter[0] + " in m", text:$foundationCount[0]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[0].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text("Length Between Spirals")
                                    TextField("Length Between Spirals in m", text:$foundationCount[1]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[1].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text("Bore Pile Diameter")
                                    TextField("Bore Pile Diameter in m", text:$foundationCount[2]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[2].isEmpty){
                                        Text("m")
                                    }
                                }
                            }
                            else{
                                HStack{
                                    Text(foundationParameter[0])
                                    TextField(foundationParameter[0] + " in m", text:$foundationCount[0]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[0].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text(foundationParameter[1])
                                    TextField(foundationParameter[1] + " in m", text:$foundationCount[1]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[1].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text(foundationParameter[2])
                                    TextField(foundationParameter[2] + " in m", text:$foundationCount[2]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[2].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text(foundationParameter[3])
                                    TextField(foundationParameter[3] + " in m", text:$foundationCount[3]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!foundationCount[3].isEmpty){
                                        Text("m")
                                    }
                                }
                            }
                        }else if(chosenStructure.structureName == "Blocks"){
                            HStack{
                                Text(blocksParameter[0])
                                TextField(blocksParameter[0] + " in m", text:$blocksCount[0]
                                ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                if(!blocksCount[0].isEmpty){
                                    Text("m")
                                }
                            }
                            HStack{
                                Text(blocksParameter[1])
                                TextField(blocksParameter[1] + " in m", text:$blocksCount[1]
                                ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                if(!blocksCount[1].isEmpty){
                                    Text("m")
                                }
                            }
                            HStack{
                                Text(blocksParameter[2])
                                TextField(blocksParameter[2] + " in m", text:$blocksCount[2]
                                ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                if(!blocksCount[2].isEmpty){
                                    Text("m")
                                }
                            }
                        }else if(chosenStructure.structureName == "Scale"){
                            HStack{
                                Text(scaleParameter[0])
                                TextField(scaleParameter[0] + " in m", text:$scaleCount[0]
                                ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                if(!scaleCount[0].isEmpty){
                                    Text("m")
                                }
                            }
                            HStack{
                                Text(scaleParameter[1])
                                TextField(scaleParameter[1] + " in m", text:$scaleCount[1]
                                ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                if(!scaleCount[1].isEmpty){
                                    Text("m")
                                }
                            }
                        }else{
                            if(selectionRoof == "Curved Roof" ){
                                HStack{
                                    Text(roofParameter[0])
                                    TextField(roofParameter[0] + " in m", text:$roofCount[0]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!roofCount[0].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text(roofParameter[1])
                                    TextField(roofParameter[1] + " in m", text:$roofCount[1]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!roofCount[1].isEmpty){
                                        Text("m")
                                    }
                                }
                            }else if(selectionRoof == "Hipped Roof" ){
                                HStack{
                                    Text("Length of the Hip Rafter")
                                    TextField("Length of the Hip Rafter in m", text:$roofCount[0]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!roofCount[0].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text("Pitch of the Roof")
                                    TextField("Pitch of the Roof in degrees", text:$roofCount[1]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!roofCount[1].isEmpty){
                                        Text("degrees")
                                    }
                                }
                            }
                            else{
                                HStack{
                                    Text(roofParameter[0])
                                    TextField(roofParameter[0] + " in m", text:$roofCount[0]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!roofCount[0].isEmpty){
                                        Text("m")
                                    }
                                }
                                HStack{
                                    Text(roofParameter[1])
                                    TextField(roofParameter[1] + " in m", text:$roofCount[1]
                                    ).multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                                    if(!roofCount[1].isEmpty){
                                        Text("m")
                                    }
                                }
                            }
                        }
                    }header: {
                        Text("Input")
                    }
                    if (result.isEmpty){
                        Button("Calculate"){
                            if(chosenStructure.structureName == "Column"){
                                result = calculateViewModel.calculateColumn(column: Column(type: selectionColumn, length:Double(columnCount[0]) ?? 0.0, width: Double(columnCount[1]) ?? 0.0, height: Double(columnCount[2]) ?? 0.0, begel: Double(columnCount[3]) ?? 0.0))
                            }else if(chosenStructure.structureName == "Foundation"){
                                result = calculateViewModel.calculateFoundation(foundation: Foundations(type: selectionFoundation, length:Double(foundationCount[0]) ?? 0.0, width: Double(foundationCount[1]) ?? 0.0, height: Double(foundationCount[2]) ?? 0.0, stoneHeight: Double(foundationCount[3]) ?? 0.0))
                            }else if(chosenStructure.structureName == "Blocks"){
                                result = calculateViewModel.calculateBlocks(block: Block(type: selectionBlocks, length:Double(blocksCount[0]) ?? 0.0, width: Double(blocksCount[1]) ?? 0.0, height: Double(blocksCount[2]) ?? 0.0))
                            }else if(chosenStructure.structureName == "Scale"){
                                result = calculateViewModel.calculateScale(scale: Scale(type: selectionScale, larger:Double(scaleCount[0]) ?? 0.0, original: Double(scaleCount[1]) ?? 0.0))
                            }else{
                                result = calculateViewModel.calculateRoof(roof: Roof(type: selectionRoof, length:Double(roofCount[0]) ?? 0.0, width: Double(roofCount[1]) ?? 0.0))
                            }
                        }.multilineTextAlignment(.center).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }else{
                        Button(action: {
                            if(chosenStructure.structureName == "Column"){
                                result = calculateViewModel.calculateColumn(column: Column(type: selectionColumn, length:Double(columnCount[0]) ?? 0.0, width: Double(columnCount[1]) ?? 0.0, height: Double(columnCount[2]) ?? 0.0, begel: Double(columnCount[3]) ?? 0.0))
                            }else if(chosenStructure.structureName == "Foundation"){
                                result = calculateViewModel.calculateFoundation(foundation: Foundations(type: selectionFoundation, length:Double(foundationCount[0]) ?? 0.0, width: Double(foundationCount[1]) ?? 0.0, height: Double(foundationCount[2]) ?? 0.0, stoneHeight: Double(foundationCount[3]) ?? 0.0))
                            }else if(chosenStructure.structureName == "Blocks"){
                                result = calculateViewModel.calculateBlocks(block: Block(type: selectionBlocks, length:Double(blocksCount[0]) ?? 0.0, width: Double(blocksCount[1]) ?? 0.0, height: Double(blocksCount[2]) ?? 0.0))
                            }else if(chosenStructure.structureName == "Scale"){
                                result = calculateViewModel.calculateScale(scale: Scale(type: selectionScale, larger:Double(scaleCount[0]) ?? 0.0, original: Double(scaleCount[1]) ?? 0.0))
                            }else{
                                result = calculateViewModel.calculateRoof(roof: Roof(type: selectionRoof, length:Double(roofCount[0]) ?? 0.0, width: Double(roofCount[1]) ?? 0.0))
                            }
                        }){
                            HStack{
                                Image(systemName: "arrow.circlepath")
                                Text("Recalculate")
                            }
                        }.multilineTextAlignment(.center).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }
                   
                    if(!result.isEmpty){
                        Section{
                            List{
                                ForEach(result) { result in
                                    HStack{
                                        Text(result.name).fontWeight(.regular)
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                        Text(result.value + " " + result.unit).fontWeight(.bold)
                                            .multilineTextAlignment(.trailing)
                                    }
                                }
                            }
//                            Image("ArchMountain").resizable().padding().frame(width: .infinity).listRowSeparator(.hidden).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
                        }header: {
                            Text("Result")
                        }
                    }
                }
            }
        }
    }            }


#Preview {
    CalculateView(chosenStructure: StructurePlan.structurePlanList[0])
        .environmentObject(CalculateViewModel())
}
