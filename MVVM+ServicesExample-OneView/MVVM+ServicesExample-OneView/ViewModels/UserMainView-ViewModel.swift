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
        let userService: UserService = UserService.shared
        @Published var sharedUser: User = User(name: "Henny", age: 28)
        
        init() {}
        
        func getUser() {
            sharedUser = userService.getUser()
        }
        
        func changeUserName(newName: String) {
            userService.changeUserName(newName: newName)
            self.getUser()
        }
        
    }
}
