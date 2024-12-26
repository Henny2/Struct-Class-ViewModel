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
//            if let user = viewModel.sharedUser {
            Text(viewModel.sharedUser.name)
                Button("change name"){
                    viewModel.changeUserName(newName: "James")
                }
//            }
        }
    }
}

#Preview {
    UserMainView()
}
