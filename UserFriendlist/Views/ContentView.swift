//
//  ContentView.swift
//  UserFriendlist
//
//  Created by Baptiste Cadoux on 18/11/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var viewModel = UserViewModel()

    @FetchRequest(entity: User.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(key: "name", ascending: true)
                  ])
    var users: FetchedResults<User>

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(users, id: \.id) { user in
                        NavigationLink(destination: UserDetailView(userId: user.getId())) {
                            Text("\(user.getName())")
                            Text("\(user.getFriends().count) friend(s)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationBarTitle("UserFriendlist (\(users.count))")
            .onAppear(perform: fetchUserFriendlist)
        }
    }

    func fetchUserFriendlist() {
        viewModel.fetchUserFriendlist()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
