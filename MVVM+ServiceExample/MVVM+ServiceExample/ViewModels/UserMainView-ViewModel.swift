//
//  UserMainView - ViewModel.swift
//  MVVM+ServiceExample
//
//  Created by Henrieke Baunack on 12/8/24.
//

import Foundation
import SwiftUI

extension UserMainView {
    class ViewModel: ObservableObject {
        @Published var user: User
        init() {
            user = UserService.shared.getUser(userID: "123")
            
            print("initializing UserMainView VM")

        }
        
        func getUser(id: String) -> User {
            let id = "123"
            user = UserService.shared.getUser(userID: id)
            return user
        }
        func getUserName(id: String) ->  String {
            let id = "123"
            let userName = self.getUser(id: id).name
            return userName
        }
        
        
        func refresh() {
            getUser(id: "123")
        }
        
        func changeUserName(id: String, newName: String){
            UserService.shared.saveUserName(userID: id, newName: newName)
            user = self.getUser(id: id) //updating what the viewModel has stored
        }
    }
}
