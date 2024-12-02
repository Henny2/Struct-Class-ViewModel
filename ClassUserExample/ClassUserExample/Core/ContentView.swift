//
//  ContentView.swift
//  ClassUserExample
//
//  Created by Henrieke Baunack on 12/1/24.
//

import SwiftUI

// does not work without @ObservableObject, @ObservedObject but then seems simpler than using structs

// this will act as the main view
struct ContentView: View {
    @ObservedObject var myself = User(name: "Henny", age: 28)
    var body: some View {
        NavigationStack {
            VStack {
                Text(myself.name)
                Button("Change name"){
                    print(myself.name)
                    myself.name = "James"
                }
            }
            .padding()
            NavigationLink("Go to detail view") {
                UserDetailView(user: myself)
            }
        }
    }
}

#Preview {
    ContentView()
}
