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
    @State var category:Int = 0
    @State var length:String = ""
    @State var width:String = ""
    var body: some View {
        NavigationStack{
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
                            Picker("Column Type", selection: $category){
                                Text("Practical Column").tag(0)
                                Text("a Column").tag(1)
                                Text("b Column").tag(2)
                            }.multilineTextAlignment(.trailing).accentColor(Colors.tertiaryColor)
                        }
                        Divider()
                        HStack{
                            Text("Length")
                            TextField("Length", text: $length).multilineTextAlignment(.trailing)
                        }.padding(.trailing)
                        Divider()
                        HStack{
                            Text("Width")
                            TextField("Width", text: $width).multilineTextAlignment(.trailing)
                        }.padding(.trailing)
                        Divider()
                        
                        Button("Calculate"){
                            
                        }.padding().foregroundColor(Colors.tertiaryColor).bold()
                        HStack{
                            Text("Steel Beams").fontWeight(.bold).font(.subheadline).foregroundColor(Colors.greyColor)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            Text("15 Pieces").fontWeight(.regular).font(.footnote)
                                .multilineTextAlignment(.trailing)
                        }.padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).listRowSeparator(.hidden).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: Colors.blurColor, radius: 8).padding(.vertical,2)
                        HStack{
                            Text("Steel Beams").fontWeight(.bold).font(.subheadline).foregroundColor(Colors.greyColor)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            Text("15 Pieces").fontWeight(.regular).font(.footnote)
                                .multilineTextAlignment(.trailing)
                        }.padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).listRowSeparator(.hidden).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: Colors.blurColor, radius: 8).padding(.vertical,2)
                        Image("ArchMountain").resizable().padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).listRowSeparator(.hidden).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: Colors.blurColor, radius: 8).padding(.vertical,2)
                    }.padding()
                }
            
        }
    }
}

#Preview {
    CalculateView(chosenStructure: StructurePlan.structurePlanList[0])
        .environmentObject(CalculateViewModel())
}
