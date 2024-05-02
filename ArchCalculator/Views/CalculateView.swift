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
    @State var column:Column = Column(type: "", length: 0.0, width: 0.0, height: 0.0, begel: 0.0)
    @State var result:[Result] = []
    @State var selection: String = ""
    @State var columnType:[String] = ["Tied Column","Spiral Column", "Practical Column"]
    @State var columnParameter:[String] = ["Length","Width", "Height", "Begel"]
    @State var foundationType:[String] = ["Raft Foundation","Spiral Column", "Composite Column"]
    @State var blocksType:[String] = ["Tied Blocks","Spiral Column", "Composite Column"]
    @State var scaleType:[String] = ["Tied Scale","Spiral Column", "Composite Column"]
    @State var roofType:[String] = ["Tied Roof","Spiral Column", "Composite Column"]
    var body: some View {
        NavigationStack {
            VStack{
                Spacer().navigationBarTitleDisplayMode(.inline).navigationTitle(chosenStructure.structureName)
                Form {
                    Section{
                        if(chosenStructure.structureName == "Column") {
                            Picker("Column Type", selection: $selection){
                                ForEach(columnType, id: \.self) {
                                    Text($0)
                                }
                            }.multilineTextAlignment(.trailing)
                        } else if(chosenStructure.structureName == "Foundation") {
                            Picker("Foundation Type", selection: $selection){
                                ForEach(foundationType, id: \.self) {
                                    Text($0)
                                }
                            }.multilineTextAlignment(.trailing)
                        }else if(chosenStructure.structureName == "Blocks") {
                            Picker("Blocks Type", selection: $selection){
                                ForEach(blocksType, id: \.self) {
                                    Text($0)
                                }
                            }.multilineTextAlignment(.trailing)
                        }else if(chosenStructure.structureName == "Scale") {
                            Picker("Scale Type", selection: $selection){
                                ForEach(scaleType, id: \.self) {
                                    Text($0)
                                }
                            }.multilineTextAlignment(.trailing)
                        }else {
                            Picker("Roof Type", selection: $selection){
                                ForEach(roofType, id: \.self) {
                                    Text($0).tag($0)
                                }
                            }.multilineTextAlignment(.trailing)
                        }
                        
                        if(chosenStructure.structureName == "Column") {
                            HStack{
                                Text(columnParameter[0])
                                TextField(columnParameter[0] + " in m", text:$columnCount[0]
                                ).multilineTextAlignment(.trailing).keyboardType(.numberPad)
                            }
                            HStack{
                                Text(columnParameter[1])
                                TextField(columnParameter[1] + " in m", text:$columnCount[1]
                                ).multilineTextAlignment(.trailing).keyboardType(.numberPad)
                            }
                            HStack{
                                Text(columnParameter[2])
                                TextField(columnParameter[2] + " in m", text:$columnCount[2]
                                ).multilineTextAlignment(.trailing).keyboardType(.numberPad)
                            }
                            HStack{
                                Text(columnParameter[3])
                                TextField(columnParameter[3] + " in cm", text:$columnCount[3]
                                ).multilineTextAlignment(.trailing).keyboardType(.numberPad)
                            }
                        }
                        
                    }header: {
                        Text("Input")
                    }
                    if (result.isEmpty){
                        Button("Calculate"){
                            result = calculateViewModel.calculateColumn(column: Column(type: selection, length:Double(columnCount[0]) ?? 0.0, width: Double(columnCount[1]) ?? 0.0, height: Double(columnCount[2]) ?? 0.0, begel: Double(columnCount[3]) ?? 0.0))
                        }.multilineTextAlignment(.center).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }else{
                        Button(action: {
                            result = calculateViewModel.calculateColumn(column: Column(type: selection, length:Double(columnCount[0]) ?? 0.0, width: Double(columnCount[1]) ?? 0.0, height: Double(columnCount[2]) ?? 0.0, begel: Double(columnCount[3]) ?? 0.0))
//                            columnCount = ["","","",""]
//                            selection = "Tied Column"
//                            result = calculateViewModel.calculateColumn(column: Column(type: "", length: 0.0, width: 0.0, height: 0.0, begel: 0.0))
                            
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
                                        Text(result.name).fontWeight(.regular).font(.subheadline).foregroundColor(Colors.greyColor)
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                        Text(result.value + " " + result.unit).fontWeight(.bold).font(.subheadline)
                                            .multilineTextAlignment(.trailing)
                                    }
                                }
                            }
                            Image("ArchMountain").resizable().padding().frame(width: .infinity).listRowSeparator(.hidden).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
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
