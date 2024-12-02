//
//  User.swift
//  StructUserExample
//
//  Created by Henrieke Baunack on 12/1/24.
//

import Foundation
import SwiftUI


struct User {
    var name: String
    var age: Int
    
    mutating func changeName(newName: String){
        self.name = newName
    }
}
