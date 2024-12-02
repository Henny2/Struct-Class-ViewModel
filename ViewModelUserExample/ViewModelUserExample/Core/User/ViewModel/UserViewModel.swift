//
//  UserViewModel.swift
//  ViewModelUserExample
//
//  Created by Henrieke Baunack on 12/1/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var sharedUser: User = User(name: "Henny", age: 28)
    
    init () {
        print("initializing UserViewModel")
    }
}

