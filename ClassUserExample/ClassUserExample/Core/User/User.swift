//
//  User.swift
//  ClassUserExample
//
//  Created by Henrieke Baunack on 12/1/24.
//

import Foundation


class User: ObservableObject {
    @Published var name: String // without published, the change of the name was happening but it was not reflected in the view, also needed to set @ObservableObject and @ObservedObject
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
