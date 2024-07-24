//
//  DogListViewCard.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import SwiftUI

struct DogListViewCard: View {
    var title: String
    var image: String
    init(title: String, image: String = ""){
        self.title = title
        self.image = image
        print(title)
       
    }
    var body: some View {
        VStack(){
            
        
                CustomImageWithRetry(url: URL(string: image), width: .infinity)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.black)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 5)
            
            
        }
        .padding(.trailing, 7)
    }
    
}

#Preview {
    DogListViewCard(title: "Dogs Name")
}


