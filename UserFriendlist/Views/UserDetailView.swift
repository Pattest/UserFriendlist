//
//  UserDetailView.swift
//  UserFriendlist
//
//  Created by Baptiste Cadoux on 19/11/2021.
//

import SwiftUI

struct UserDetailView: View {

    var user: User

    var body: some View {
        VStack {
            Text("\(user.getAbout())")
                .padding()
            List {
                ForEach(user.getFriends(), id: \.self) { friend in
                    Text("\(friend.getName())")
                }
            }
        }
        .navigationBarTitle("\(user.getName())")
    }

    init(user: User) {
//        let fetchRequest = FetchRequest<User>(
//            entity: User.entity(),
//            sortDescriptors: [],
//            predicate: NSPredicate(format: "id == %@", userId))
//        self.user = fetchRequest.wrappedValue.first ?? User()
        self.user = user
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView(userId: "0")
//    }
//}
