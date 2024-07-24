//
//  CustomTextField.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import SwiftUI

struct CustomTextfield: View {
    @Binding var text: String
    var placeHolder: String
    var editText: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            
                TextField(placeHolder, text: $text)
                    .padding(EdgeInsets(top: 13, leading: 18, bottom: 13, trailing:0))
                    .foregroundStyle(.black)
                    .font(.callout)
                    .disabled(editText)
                    .background(RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 0.5))
                
        }
    }
}

#Preview {
    CustomTextfield(text: .constant("Search field data"), placeHolder: "Search")
}
