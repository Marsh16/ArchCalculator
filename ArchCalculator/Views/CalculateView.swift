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
                        Picker("Column Type", selection: $category){
                            Text("Practical Column").tag(0)
                            Text("a Column").tag(1)
                            Text("b Column").tag(2)
                        }.frame(maxWidth: .infinity).multilineTextAlignment(.trailing)
                    }
                    Divider()
                    HStack{
                        Text("Length")
                        TextField("Length", text: $length).multilineTextAlignment(.trailing)
                    }
                    Divider()
                    HStack{
                        Text("Width")
                        TextField("Width", text: $width).multilineTextAlignment(.trailing)
                    }
                    Divider()
                    Button("Calculate"){
                        
                    }.padding()
                    
                    HStack{
                        Text("Length")
                        TextField("Length", text: $length).multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Text("Width")
                        TextField("Width", text: $width).multilineTextAlignment(.trailing)
                    }
                    Image("ArchMountain").resizable()
                }.padding()
            }
        }
    }
}

#Preview {
    CalculateView(chosenStructure: StructurePlan.structurePlanList[0])
        .environmentObject(CalculateViewModel())
}
