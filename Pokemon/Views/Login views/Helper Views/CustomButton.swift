//
//  CustomButton.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 28/08/2024.
//

import SwiftUI

struct CustomButton: View {
    
    var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .frame(height: 44)
                .padding(.horizontal, 20)
                .foregroundColor(.pokemonPrimary)
            Text(title)
                .foregroundColor(.pokemonSecondaryLight)
                .fontWeight(.heavy)
        }
        
            
    }
}

#Preview {
    CustomButton(title: "Log In")
}
