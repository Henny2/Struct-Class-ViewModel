//
//  UserService.swift
//  MVVM+ServiceExample
//
//  Created by Henrieke Baunack on 12/8/24.
//

import Foundation

class UserService: ObservableObject {
    
    static var user: User = User(name: "Henny", age: 28) // pretend this is in the database
    static let shared = UserService()
    
    func getUser(userID: String) -> User{
        return UserService.user
    }
    
    func saveUserName(userID: String, newName: String){
        // change the name in the backend
        UserService.user.name = newName
    }
}
