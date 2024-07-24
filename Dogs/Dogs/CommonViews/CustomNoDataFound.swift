//
//  CustomNoDataFound.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/24/24.
//

import SwiftUI

struct CustomNoDataFound: View {
    var body: some View {
        VStack(alignment:.center){
            Spacer()
            
          Image("Nodata")
                .resizable()
                .frame(width: 100, height: 100)
            .padding()
            
            Text(NoDataStrings.NoData.localized)
                .frame(maxWidth: .infinity)
                .font(.title)
            Spacer()
        }
    }
}

#Preview {
    CustomNoDataFound()
}
