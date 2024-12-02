//
//  ContentView.swift
//  StructUserExample
//
//  Created by Henrieke Baunack on 12/1/24.
//

import SwiftUI

// Learnings
// It is possible to make structs mutable, i.e. use @State variables and mutable functions
// It is also possible to hand structs around, and share state. You will have to use @State and @Binding a lot and I might have not even seen some drawbacks
// I can see how using a class is much simpler



// this will act as the main view in this example

struct Employee {
    var name: String
    var company: String
    
    mutating func changeName(newName: String) {
        self.name = newName
    }
}

struct ContentView: View {
    // great explanation here: https://www.hackingwithswift.com/forums/swiftui/what-is-meant-by-self-is-immutable-in-this-example/15188
    @State var me = User(name: "Henny", age: 28) // changing these to @State variables, lets you change them
    @State var emp = Employee(name: "James", company: "IBM")
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text(me.name)
                    Button("Change name"){
                        //                    me.name = "JP"
                        print(me.name)
                        me.changeName(newName: "Jenny")
                        print(me.name)
                    }
                }
                .padding()
                
                NavigationLink("Go to detail view"){
                    UserDetailView(user: $me)
                }
    
                // what if the struct is in the same file
                VStack {
                    Text(emp.name)
                    Button("Change name"){
                        emp.changeName(newName: "Robert")
                        //                    emp.name = "JP"
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
