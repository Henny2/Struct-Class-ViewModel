//
//  UserService.swift
//  MVVM+ServicesExample-OneView
//
//  Created by Henrieke Baunack on 12/21/24.
//

import Foundation
import SwiftUI

class UserService: ObservableObject {
    static var user: User = User(name: "Henny", age: 28) // database
    static let shared = UserService()
    
    @Published var sharedUser: User? = nil // storing the user
    
    init() {
        getUser()
    }
    
    func getUser() {
        sharedUser = UserService.user
    }
    
    func changeUserName(newName: String){
        UserService.user.name = newName
        getUser()
    }
}
