//
//  SplashView.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 24/04/24.
//

import SwiftUI

var POINT = -90.0;
var SECOND = 2.5;

//tampilan splashview
struct SplashView: View {
    @State var isActive: Bool = false
    var body: some View {
        if self.isActive {
            HomeView().environmentObject(CalculateViewModel())
        }
        else{
            ZStack(){
                VStack (alignment: .center){
                    Text("ArchCalculator").fontWeight(.bold).font(.largeTitle)
                    Text("An app to help you calculate your structural plan").fontWeight(.medium).padding(.horizontal).font(.headline).multilineTextAlignment(.center)
                }.padding([.bottom], 120)
                VStack(alignment: .trailing){
                    Spacer()
                    Image("Logo-dark").resizable()
                        .scaledToFit()
                }.padding(.zero).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }        .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + SECOND){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
