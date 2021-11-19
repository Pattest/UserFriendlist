//
//  Friend+CoreDataProperties.swift
//  UserFriendlist
//
//  Created by Baptiste Cadoux on 19/11/2021.
//
//

import Foundation
import CoreData

extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: User?

}

extension Friend : Identifiable {

}
