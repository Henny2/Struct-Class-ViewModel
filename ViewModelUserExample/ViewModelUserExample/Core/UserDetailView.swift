//
//  UserDetailView.swift
//  ViewModelUserExample
//
//  Created by Henrieke Baunack on 12/1/24.
//

import SwiftUI

struct UserDetailView: View {
    @ObservedObject var userViewModel: UserViewModel // means this object is observing what was declared as @ObservableObject
    
    var body: some View {
        Text(userViewModel.sharedUser.name)
        Button("Change name from Detail View"){
            print(userViewModel.sharedUser.name)
            userViewModel.sharedUser.name = "Rebecca"
            print(userViewModel.sharedUser.name)
        }
    }
}

#Preview {
    UserDetailView(userViewModel: UserViewModel())
}
