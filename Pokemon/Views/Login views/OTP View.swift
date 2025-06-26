//
//  OTP View.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 31/08/2024.
//

import SwiftUI

struct OTPView: View {
   
    @EnvironmentObject var model: ForgotPasswordViewModel
    @EnvironmentObject var loginModel: LoginViewModel
    
    var body: some View {
        VStack {
            
            Image("PokemonLogo")
                .resizable()
                .scaledToFit()
                .padding(.top, 40)
                .padding(.horizontal)
            
            Spacer()
            
            HStack {
                Text("Enter Verification code")
                    .font(.caption)
                    .foregroundColor(.pokemonPrimary)
                Spacer()
            }.padding(.leading, 20)
            
            if model.otpError {
                HStack {
                    Text("OTP is wrong")
                        .font(.caption)
                        .foregroundColor(.red)
                    Spacer()
                }.padding(.leading, 20)
                
            }
            
            
            CustomTextField(value: $model.otp, title: "OTP", prompt: "Enter OTP")
                .padding(.bottom, 40)
            
            Button {
                // Code for log in
                // call the model method
                model.verifyOtp()
            } label: {
                CustomButton(title: "Verify OTP")
            }
            
            Spacer()
            
            Spacer()
            
            HStack {
                Text("Already have an account")
                Button {
                    loginModel.loginViewState = .login
                } label: {
                    Text("Log In!")
                        .foregroundColor(.pokemonSecondary)
                        .fontWeight(.medium)
                }

            }
            .italic()
            .font(.caption)
            
            HStack {
                Text("Dont have an account?")
                Button {
                    loginModel.loginViewState = .signUp
                } label: {
                    Text("Sign in")
                        .foregroundColor(.pokemonSecondary)
                        .fontWeight(.medium)
                }

            }
            .italic()
            .font(.caption)
            
        }
    }
}

//#Preview {
//    OTPView()
//}
