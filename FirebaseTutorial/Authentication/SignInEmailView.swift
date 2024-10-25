//
//  SignInEmailView.swift
//  FirebaseTutorial
//
//  Created by Joyanta Mondal on 25/10/24.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

struct SignInEmailView: View {
    @StateObject private var viewmodel = SignInEmailViewModel()
    
    var body: some View {
        VStack {
            TextField("Email...", text: $viewmodel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            SecureField("Password...", text: $viewmodel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                viewmodel.signIn()
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Signin with Email")
    }
}

#Preview {
    NavigationStack {
        SignInEmailView()
    }
}
