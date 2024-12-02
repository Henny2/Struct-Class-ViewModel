//
//  UserDetailView.swift
//  StructUserExample
//
//  Created by Henrieke Baunack on 12/1/24.
//

import SwiftUI

struct UserDetailView: View {
    @Binding var user: User
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
    UserDetailView(user: .constant(User(name: "Henny", age: 1)))
}
