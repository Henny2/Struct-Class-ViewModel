//
//  ContentView.swift
//  ViewModelUserExample
//
//  Created by Henrieke Baunack on 12/1/24.
//

import SwiftUI

// this will act as the main view

struct ContentView: View {
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(userViewModel.sharedUser.name)
                Button("Change name"){
                    print(userViewModel.sharedUser.name)
                    userViewModel.sharedUser.name = "James"
                    print(userViewModel.sharedUser.name)
                }
            }
            .padding()
            
            NavigationLink("Go to detail view"){
                UserDetailView(userViewModel: userViewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
