//
//  HomeView.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 26/04/24.
//

import SwiftUI

//tampilan home view
struct HomeView: View {
    @StateObject var structurePlanViewModel = StructurePlanViewModel()
    @State private var isPresenting: Bool = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack{
            VStack{
                if (structurePlanViewModel.filteredStructurePlan.count == 0){
                    ContentUnavailableView.search
                }
                List(structurePlanViewModel.filteredStructurePlan){
                    structurePlan in
                    if (colorScheme == .dark){
                        ZStack(alignment: .leading) {
                            HStack{
                                VStack{
                                    HStack{
                                        VStack{
                                            Image(structurePlan.structureIcon).resizable().padding().frame(width: 80, height: 80).scaledToFit()
                                        }
                                        VStack{
                                            NavigationLink(destination: CalculateView(chosenStructure: structurePlan) .environmentObject(CalculateViewModel())){
                                                VStack{
                                                    Text(structurePlan.structureName).fontWeight(.bold).font(.title2)
                                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                                    Text(structurePlan.structureDescription).fontWeight(.regular).font(.caption)
                                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                                }
                                            }
                                        }
                                    }
                                }
                            }.padding(.vertical)
                        }.listRowSeparator(.hidden).listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .background(.clear)
                                .foregroundColor(Colors.greyColor)
                                .padding(
                                    EdgeInsets(
                                        top: 8,
                                        leading: 0,
                                        bottom: 8,
                                        trailing: 0
                                    )
                                )
                        )
                    }               else{
                        ZStack(alignment: .leading) {
                            HStack{
                                VStack{
                                    HStack{
                                        VStack{
                                            Image(structurePlan.structureIcon).resizable().padding().frame(width: 80, height: 80).scaledToFit()
                                        }
                                        VStack{
                                            NavigationLink(destination: CalculateView(chosenStructure: structurePlan) .environmentObject(CalculateViewModel())){
                                                VStack{
                                                    Text(structurePlan.structureName).fontWeight(.bold).font(.title2)
                                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                                    Text(structurePlan.structureDescription).fontWeight(.regular).font(.caption)
                                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                                }
                                            }
                                        }
                                    }
                                }
                            }.padding(.vertical)
                        }.listRowSeparator(.hidden).listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .background(.clear)
                                .foregroundColor(.white)
                                .padding(
                                    EdgeInsets(
                                        top: 8,
                                        leading: 0,
                                        bottom: 8,
                                        trailing: 0
                                    )
                                )
                        )
                    }
                }
            }.navigationTitle("ArchCalculator")
                .toolbar{
                    Button{
                        isPresenting.toggle()
                    }
                label:{
                    Image(systemName: "info.circle")
                }
                }.sheet(isPresented: $isPresenting){
                    NavigationStack{
                        Form {
                            Section{
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: "questionmark.app.fill").resizable().frame(width: 25, height: 25, alignment: .center).foregroundColor(.blue)
                                        Text("What is ArchCalculator?").font(.title2).bold()
                                    }
                                    Text("ArchCalculator is an app to help Achitecture Student Calculate Structural Plans. There are many categories, such as Column, Foundation Blocks, Scale and Roof. Each categories have their own calculation which calculate according to the type of structure of each category.").font(.headline).fontWeight(.regular)
                                    HStack{
                                        Image(systemName: "list.bullet.clipboard.fill").resizable().frame(width: 20, height: 30, alignment: .center).foregroundColor(.blue)
                                        Text("How it Works?").font(.title2).bold()
                                    }.padding(.top)
                                    Text("1. Choose the category (Column, Foundation, Blocks, Scale or Roof)").font(.headline).fontWeight(.regular)
                                    Text("2. Input the value you want to calculate").font(.headline).fontWeight(.regular)
                                    Text("3. Press the calculate button or recalculate button (if you want to recalculate)").font(.headline).fontWeight(.regular)
                                    Text("4. Read your result!").font(.headline).fontWeight(.regular)
                                    
                                    Spacer()
                                }.toolbar{
                                    Button("Done"){
                                        isPresenting.toggle()
                                    }.padding().multilineTextAlignment(.leading)
                                }.navigationBarTitleDisplayMode(.inline).navigationTitle("About").padding()
                            }
                        }
                    }
                }
            
        }.searchable(text: $structurePlanViewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        //        {
        //            ContentUnavailableView.search
        //        }
    }
}

#Preview {
    HomeView()
}
