//
//  LoginScreen.swift
//  Login Page
//
//  Created by Mukesh Rajput on 26/08/24.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject private var viewModel: LoginVM = LoginVM()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Image("logo")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .clipShape(.circle)
                
                VStack(alignment: .center){
                    TextField("Email", text: $viewModel.loginDC.email
                    ).textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, 20)
                    
                    SecureField("Password", text: $viewModel.loginDC.password ).textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                    
                    VStack(alignment: .leading){
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: viewModel.loginDC.isRemember ? "checkmark.square" : "square")
                                .frame(width: 30, height: 30)
                            Text("Remember Me")
                            Spacer()
                        }.padding(.top, 10).onTapGesture {
                            viewModel.loginDC.isRemember.toggle()
                        }
                    }
                    
                    
                    Button(action: {
                        viewModel.login()
                    }){
                        Text("Login")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    }.background(.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                        .frame(maxWidth: .infinity)
                    
                }
            }.padding().alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Success"), message: Text("Email: \(viewModel.loginDC.email) \n Password:\(viewModel.loginDC.password) \n isRemember:\(viewModel.loginDC.isRemember)"), dismissButton: .default(Text("Dismiss")))
            })
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginScreen()
}
