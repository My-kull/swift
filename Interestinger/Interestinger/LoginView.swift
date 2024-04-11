//
//  LoginView.swift
//  Interestinger
//
//  Created by Micael Raste on 14.2.2024.
//
import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.gray, Color.black],
    startPoint: .top, endPoint: .bottom)

struct LoginView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @State private var isAuthenticated: Bool = false
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            NavigationLink(destination: CustomChannelList(), isActive: $isAuthenticated) {
                EmptyView()
            }
            
            Text("Welcome!")
                .font(.title)
                .foregroundColor(.white)
                .padding([.top, .bottom], 50)
                .shadow(radius: 6.0, x: 10, y: 10)
            
            Image("logo")
                .resizable()
                .frame(width: 180, height: 180)
                .clipShape(Rectangle())
                .overlay(Rectangle()
                    .stroke(Color.white, lineWidth: 3))
                .shadow(radius: 9.0, x: 20, y: 10)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25.0)
                    .shadow(radius: 10.0, x: 5, y: 10)
                
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25.0)
                    .shadow(radius: 10.0, x: 5, y: 10)
            }
            .padding([.leading, .trailing], 50)
            
            Button(action: {
                // Add your authentication logic here
                // Example: authenticate(username: self.username, password: self.password)
            }) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 60)
                    .background(Color("Orange"))
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }
            .padding(.top, 50)
            
            Spacer()
            
            HStack {
                Text("Don't have an account? ")
                    .foregroundColor(.white)
                Button(action: {}) {
                    Text("Sign Up")
                        .foregroundColor(.yellow)
                }
            }
            .padding(.bottom, 20)
        }
        .background(backgroundGradient)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
