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
                List{
                    Text("calculateViewModel.searchText")
                }
                Text("saasas")
            }
        }
    }
}

#Preview {
    CalculateView(chosenStructure: StructurePlan.structurePlanList[0])
        .environmentObject(CalculateViewModel())
}
