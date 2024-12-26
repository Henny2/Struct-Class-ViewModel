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
    
    init() {}
    
    func getUser() -> User {
        return UserService.user
    }
    
    func changeUserName(newName: String) {
        UserService.user.name = newName
    }
}
