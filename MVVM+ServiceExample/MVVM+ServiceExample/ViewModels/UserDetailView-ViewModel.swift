//
//  UserDetailView - ViewModel.swift
//  MVVM+ServiceExample
//
//  Created by Henrieke Baunack on 12/8/24.
//

import Foundation
import SwiftUI

extension UserDetailView {
    class ViewModel : ObservableObject {
        @Published var user: User 
        
        init() {
            self.user = UserService.shared.getUser(userID: "123")
            
            print("initializing UserDetailView VM")
        }
        
        func getUser(id: String) -> User {
            let id = "123"
            self.user = UserService.shared.getUser(userID: id)
            return user
        }
        func getUserName(id: String) -> String {
            let id = "123"
            return self.getUser(id: id).name
        }
        
        func changeUserName(id: String, newName: String){
            UserService.shared.saveUserName(userID: id, newName: newName)
            self.user = getUser(id: id)
        }
    }
}
