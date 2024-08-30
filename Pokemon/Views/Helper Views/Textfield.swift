//
//  Textfield.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 28/08/2024.
//

import SwiftUI

struct CustomTextField: View {
    
    @State var value: String = ""
    
    var title: String
    var prompt: String
    
    var body: some View {
        HStack(spacing: 20) {
            
            Text(title)
                .foregroundColor(.pokemonPrimary)
                .frame(width: 75,alignment: .leading)
            
            TextField(title, text: $value, prompt: Text(prompt))
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

#Preview {
    
    CustomTextField(title: "Email", prompt: "Email")
}
