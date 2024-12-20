//
//  MVVM_ServiceExampleApp.swift
//  MVVM+ServiceExample
//
//  Created by Henrieke Baunack on 12/8/24.
//

import SwiftUI

@main
struct MVVM_ServiceExampleApp: App {
    @StateObject var userService = UserService()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userService) //initializing UserService once for every viewModel that needs it
        } 
    }
}
