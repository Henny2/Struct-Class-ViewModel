//
//  UserMainView.swift
//  MVVM+ServicesExampleV2
//
//  Created by Henrieke Baunack on 12/21/24.
//
import SwiftUI

struct UserMainView: View {
//    @StateObject var viewModel = ViewModel()
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Text(viewModel.user?.name ?? "")
                Text((viewModel.userService.sharedUser?.name)!)
                Button("Change name") {
//                    print(viewModel.user?.name ?? "")
                    viewModel.changeUserName(id: "123", newName: "James")
                    print(viewModel.userService.sharedUser?.name ?? "")
//                    print(viewModel.user?.name ?? "")
                }
                Text(viewModel.userService.sharedUser?.name ?? "")
            }
            .padding()
            
            // this fixes the issue as it resets the user when you navigate back from the detailview to the main view
//            .onAppear(perform: viewModel.refresh)

            NavigationLink("Go to detail view") {
//                UserDetailView(viewModel: viewModel)
                UserDetailView()
            }
        }
    }
}

#Preview {
    UserMainView()
}
