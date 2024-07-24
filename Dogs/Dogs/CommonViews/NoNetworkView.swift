//
//  NoNetworkView.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/24/24.
//

import SwiftUI

struct NoNetworkView: View {
    var retryAction: () -> Void
    var body: some View {
        VStack(alignment:.center){
            Spacer()
            
            Text(NoNetworkStrings.NoInternetConnection.localized)
                .frame(maxWidth: .infinity)
                .font(.title)
            
            
            Text(NoNetworkStrings.NoNetworkContent.localized)
                .font(.callout)
                .foregroundStyle(.gray)
            
            Button(action: retryAction, label: {
                Text(NoNetworkStrings.Refresh.localized)
                    .foregroundStyle(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.orange))
            })
            
            .padding()
            Spacer()
        }
    }
}

#Preview {
    NoNetworkView(retryAction: {})
}
