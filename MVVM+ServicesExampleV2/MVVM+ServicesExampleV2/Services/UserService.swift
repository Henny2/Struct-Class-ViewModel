//
//  UserService.swift
//  MVVM+ServicesExampleV2
//
//  Created by Henrieke Baunack on 12/21/24.
//

import Foundation

class UserService: ObservableObject {
    
    static var user: User = User(name: "Henny", age: 28) // pretend this is in the database
    static let shared = UserService()
    
    
    @Published var sharedUser: User? = nil // this is the User we wil use in the viewModels
    
    
    init(){
        let _ = self.getUser(userID: "123")
    }
    
    // getting user from database (in this case class variable)
    func getUser(userID: String) -> User {
        guard let user = sharedUser else {
            // fetch user and assign
            let fetchedUser = User(name: "Henny", age: 28)
            sharedUser = fetchedUser
            return fetchedUser
        }
        // otherwise
        sharedUser = user
        return user
    }
    
    func saveUserName(userID: String, newName: String){
        // change the name in the backend
        print("START UserService: change username")
        print(UserService.shared.sharedUser?.name ?? "")
        if UserService.shared.sharedUser != nil {
            UserService.shared.sharedUser?.name = newName
        }
        else {
            print("DEBUG: could not save the new name")
        }
        print(UserService.shared.sharedUser?.name ?? "")
        print("END UserService: change username")
    }
}


// call this in mainview for example
//UserService.shared.getUser(userID: "123")
