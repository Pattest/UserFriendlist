//
//  UserViewModel.swift
//  UserFriendlist
//
//  Created by Baptiste Cadoux on 19/11/2021.
//

import Foundation
import SwiftUI

class UserViewModel {

    func fetchUserFriendlist() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }

            do {
                _ = try JSONDecoder().decode([User].self, from: data)
            } catch {
                //
            }
        }.resume()
    }
}
