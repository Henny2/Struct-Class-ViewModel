//
//  UserMainView.swift
//  MVVM+ServicesExample-OneView
//
//  Created by Henrieke Baunack on 12/21/24.
//

import SwiftUI

struct UserMainView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Text(viewModel.userService.sharedUser!.name)
            Text(viewModel.user.name)
            Button("change name"){
                print(viewModel.user.name)
                viewModel.changeUserName(newName: "James")
                print(viewModel.user.name)
            }
        }
    }
}

#Preview {
    UserMainView()
}
