//
//  UserDetailView.swift
//  MVVM+ServiceExample
//
//  Created by Henrieke Baunack on 12/8/24.
//

import SwiftUI

struct UserDetailView: View {
//    @StateObject var viewModel = ViewModel()
//    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var viewModel: UserMainView.ViewModel
    var body: some View {
        Text(viewModel.user.name)
        Button("Change name from Detail View"){
            print(viewModel.user.name)
            viewModel.changeUserName(id: "123", newName: "Rebecca")
            print(viewModel.user.name)
        }
    }
}

#Preview {
    UserDetailView(viewModel: UserMainView.ViewModel())
}
