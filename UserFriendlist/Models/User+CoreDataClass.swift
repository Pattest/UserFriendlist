//
//  User+CoreDataClass.swift
//  UserFriendlist
//
//  Created by Baptiste Cadoux on 19/11/2021.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Codable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case age
        case company
        case email
        case address
        case about
        case friends
    }

    // MARK: - Codable + CoreData

    required convenience public init(from decoder: Decoder) throws {

        // CoreData Init
        let context = PersistenceController.shared.container.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else {
            fatalError("User+CoreDataClass: Error with entity")
        }
        self.init(entity: entity, insertInto: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int16.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(String.self, forKey: .address)
        self.about = try container.decode(String.self, forKey: .about)
        self.friends = NSSet(array: try (container.decode([Friend].self, forKey: .friends)))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(email, forKey: .email)
        try container.encode(company, forKey: .company)
        try container.encode(address, forKey: .address)
        try container.encode(about, forKey: .about)

        if let friends = friends?.allObjects as? [Friend] {
            try container.encode(friends, forKey: .friends)
        }
    }

    // MARK: - Getter
    
    func getId() -> String {
        id ?? "Unknown id"
    }

    func getName() -> String {
        name ?? "Unknown name"
    }

    func getCompany() -> String {
        company ?? "Unknown company"
    }

    func getEmail() -> String {
        email ?? "Unknown email"
    }

    func getAddress() -> String {
        address ?? "Unknown address"
    }

    func getAbout() -> String {
        about ?? "Unknown about"
    }

    func getFriends() -> [Friend] {
        let set = friends as? Set<Friend> ?? []
        
        return set.sorted {
            $0.getName() < $1.getName()
        }
    }
}
