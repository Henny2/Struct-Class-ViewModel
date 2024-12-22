//
//  UserMainView.swift
//  MVVM+ServiceExample
//
//  Created by Henrieke Baunack on 12/8/24.
//

import SwiftUI

// when I navigate back from the detail view to the main view, the mainview has not updated. I believe that is because it did not have to re-initialize. But when navigating to the detail view it, initializes.


//DO THIS
// maybe add some print statements to the init functions of the viewmodels to check that!

//AFTERWARDS
// try binding the user from main view to user from detail view
// or call the update User function onAppear from the main view


// FINDINGS: when something on the main view changes, the viewmodel of the detailview gets reinitialized, not sure why
// onAppear(refresh main view data) fixes the "issue" but I'd say that bad practice because that adds logic back into the view
// I think binding the detail view and the main view is the way to go but that would kinda go agains the "one VM for one view i.e. 1-1 mapping rule"

struct UserMainView: View {
//    @StateObject var viewModel = ViewModel()
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Text(viewModel.user.name)
                Button("Change name") {
                    print(viewModel.user.name)
                    viewModel.changeUserName(id: "123", newName: "James")
                    print(viewModel.user.name)
                }
            }
            .padding()
            
            // this fixes the issue as it resets the user when you navigate back from the detailview to the main view
//            .onAppear(perform: viewModel.refresh)

            NavigationLink("Go to detail view") {
//                UserDetailView(viewModel: viewModel)
                UserDetailView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    UserMainView()
}
