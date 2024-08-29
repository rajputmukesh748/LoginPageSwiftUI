//
//  ContentView.swift
//  Login Page
//
//  Created by Mukesh Rajput on 26/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNavigateEnable: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 200.0, height: 200.0)
                    .clipShape(.circle)
            }
            .padding().onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                    self.isNavigateEnable = true
                })
            }).navigationDestination(isPresented: $isNavigateEnable){
                LoginScreen()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
