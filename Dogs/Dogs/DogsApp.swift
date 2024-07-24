//
//  DogsApp.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import SwiftUI

@main
struct DogsApp: App {
    
    init(){
        NetworkManager.shared.isConnected()
    }
    
    var body: some Scene {
        WindowGroup {
            DogsListView()
        }
    }
}
