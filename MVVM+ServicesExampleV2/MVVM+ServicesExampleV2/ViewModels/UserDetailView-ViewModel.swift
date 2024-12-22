//
//  UserDetailView-ViewModel.swift
//  MVVM+ServicesExampleV2
//
//  Created by Henrieke Baunack on 12/21/24.
//

import Foundation
import SwiftUI

extension UserDetailView {
    class ViewModel : ObservableObject {
        @ObservedObject var userService = UserService.shared
        @Published var user : User? = nil
        
        init() {
            guard let tempUser = userService.sharedUser else { return }
            user = tempUser
            print("initializing UserDetailView VM")
        }
        
        func getUser(id: String) -> User {
            userService.getUser(userID: id)
            guard let user = userService.sharedUser else { return User(name: "", age: 9999) }
            return user
        }
        func getUserName(id: String) -> String {
            let id = "123"
            return self.getUser(id: id).name
        }
        
        func changeUserName(id: String, newName: String){
            userService.saveUserName(userID: id, newName: newName)
            getUser(id: "123")
        }
    }
}
