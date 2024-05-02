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
    @State var columnParameter:[String] = ["Length","Width", "Heigth", "Begel"]
    @State var foundationType:[String] = ["Raft Foundation","Spiral Column", "Composite Column"]
    @State var blocksType:[String] = ["Tied Blocks","Spiral Column", "Composite Column"]
    @State var scaleType:[String] = ["Tied Scale","Spiral Column", "Composite Column"]
    @State var roofType:[String] = ["Tied Roof","Spiral Column", "Composite Column"]
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    Spacer().navigationBarBackButtonHidden(true).navigationBarTitleDisplayMode(.inline).navigationTitle(chosenStructure.structureName).toolbar(content: {
                        ToolbarItem(placement: .topBarLeading){
                            Button(action:{ presentationMode.wrappedValue.dismiss()}, label: {
                                Image(systemName: "chevron.backward").foregroundColor(Colors.tertiaryColor).font(.system(size: 16, weight: .semibold))
                            })
                        }
                    })
                    VStack{
                        HStack{
                            Text("Column Type")
                            Spacer()
                            if(chosenStructure.structureName == "Column") {
                                Picker("Column Type", selection: $selection){
                                    ForEach(columnType, id: \.self) {
                                        Text($0)
                                    }
                                }.multilineTextAlignment(.trailing).accentColor(Colors.tertiaryColor)
                            } else if(chosenStructure.structureName == "Foundation") {
                                Picker("Foundation Type", selection: $selection){
                                    ForEach(foundationType, id: \.self) {
                                        Text($0)
                                    }
                                }.multilineTextAlignment(.trailing).accentColor(Colors.tertiaryColor)
                            }else if(chosenStructure.structureName == "Blocks") {
                                Picker("Blocks Type", selection: $selection){
                                    ForEach(blocksType, id: \.self) {
                                        Text($0)
                                    }
                                }.multilineTextAlignment(.trailing).accentColor(Colors.tertiaryColor)
                            }else if(chosenStructure.structureName == "Scale") {
                                Picker("Scale Type", selection: $selection){
                                    ForEach(scaleType, id: \.self) {
                                        Text($0)
                                    }
                                }.multilineTextAlignment(.trailing).accentColor(Colors.tertiaryColor)
                            }else {
                                Picker("Roof Type", selection: $selection){
                                    ForEach(roofType, id: \.self) {
                                        Text($0).tag($0)
                                    }
                                }.multilineTextAlignment(.trailing).accentColor(Colors.tertiaryColor)
                            }
                        }
                        Divider()
                        if(chosenStructure.structureName == "Column") {
                            HStack{
                                Text(columnParameter[0])
                                TextField(columnParameter[0] + " in m", text:$columnCount[0]
                                ).multilineTextAlignment(.trailing)
                            }.padding(.trailing)
                            Divider()
                            HStack{
                                Text(columnParameter[1])
                                TextField(columnParameter[1] + " in m", text:$columnCount[1]
                                ).multilineTextAlignment(.trailing)
                            }.padding(.trailing)
                            Divider()
                            HStack{
                                Text(columnParameter[2])
                                TextField(columnParameter[2] + " in m", text:$columnCount[2]
                                ).multilineTextAlignment(.trailing)
                            }.padding(.trailing)
                            Divider()
                            HStack{
                                Text(columnParameter[3])
                                TextField(columnParameter[3] + " in cm", text:$columnCount[3]
                                ).multilineTextAlignment(.trailing)
                            }.padding(.trailing)
                            Divider()
                        }
                        Button("Calculate"){
                            result = calculateViewModel.calculateColumn(column: Column(type: selection, length:Double(columnCount[0]) ?? 0.0, width: Double(columnCount[1]) ?? 0.0, height: Double(columnCount[2]) ?? 0.0, begel: Double(columnCount[3]) ?? 0.0))
                        }.padding().foregroundColor(Colors.tertiaryColor).bold()
                        ForEach(result) { result in
                            HStack{
                                Text(result.name).fontWeight(.bold).font(.subheadline).foregroundColor(Colors.greyColor)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                Text(result.value + " " + result.unit).fontWeight(.regular).font(.footnote)
                                    .multilineTextAlignment(.trailing)
                            }.padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).listRowSeparator(.hidden).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(color: Colors.blurColor, radius: 8).padding(.vertical,2)
                        }
                        Image("ArchMountain").resizable().padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).listRowSeparator(.hidden).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: Colors.blurColor, radius: 8).padding(.vertical,2)
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    CalculateView(chosenStructure: StructurePlan.structurePlanList[0])
        .environmentObject(CalculateViewModel())
}
