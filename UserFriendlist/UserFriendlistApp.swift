//
//  UserFriendlistApp.swift
//  UserFriendlist
//
//  Created by Baptiste Cadoux on 18/11/2021.
//

import SwiftUI

@main
struct UserFriendlistApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
