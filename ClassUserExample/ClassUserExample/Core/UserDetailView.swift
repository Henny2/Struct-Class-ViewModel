//
//  UserDetailView.swift
//  ClassUserExample
//
//  Created by Henrieke Baunack on 12/1/24.
//

import SwiftUI

struct UserDetailView: View {
    @ObservedObject var user: User // need to make this an observedObject as well, otherwise changes are not displayed
    var body: some View {
        Text(user.name)
        Button("Change name from Detail View"){
            print(user.name)
            user.name = "Rebecca"
            print(user.name)
        }
    }
}

#Preview {
    UserDetailView(user: User(name: "Henny", age: 1))
}
