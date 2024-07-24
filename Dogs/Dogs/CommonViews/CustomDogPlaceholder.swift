//
//  CustomDogPlaceholder.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/24/24.
//

import SwiftUI

struct CustomDogPlaceholder: View {
    var body: some View {
        VStack{
            Image("PlaceHolderDog")
            Text(ModuleStrings.NoImagefound.localized)
        }
    }
}

#Preview {
    CustomDogPlaceholder()
}
