//
//  Friend+CoreDataClass.swift
//  UserFriendlist
//
//  Created by Baptiste Cadoux on 19/11/2021.
//
//

import Foundation
import CoreData

@objc(Friend)
public class Friend: NSManagedObject, Codable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    // MARK: - Codable + CoreData

    required convenience public init(from decoder: Decoder) throws {

        // CoreData Init
        let context = PersistenceController.shared.container.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Friend", in: context) else {
            fatalError("Friend+CoreDataClass: Error with entity")
        }
        self.init(entity: entity, insertInto: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }

    // MARK: - Getter

    func getId() -> String {
        id ?? "Unknown id"
    }

    func getName() -> String {
        name ?? "Unknown name"
    }
}
