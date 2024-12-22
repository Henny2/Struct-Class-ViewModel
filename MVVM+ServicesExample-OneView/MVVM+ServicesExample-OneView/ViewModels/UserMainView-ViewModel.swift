//
//  UserMainView-ViewModel.swift
//  MVVM+ServicesExample-OneView
//
//  Created by Henrieke Baunack on 12/21/24.
//

import Foundation
import SwiftUI

extension UserMainView {
    class ViewModel: ObservableObject {
        @ObservedObject var userService = UserService.shared
        @Published var user: User
        
        init() {
            if let user = UserService.shared.sharedUser {
                self.user = user
            }
            else {
                user = User(name: "Example", age: 99)
            }
        }
        
        func getUser() {
            userService.getUser()
            if let user = userService.sharedUser {
                self.user = user
            }
        }
        
        func changeUserName(newName: String) {
            self.userService.changeUserName(newName: newName)
        }
        
    }
}
