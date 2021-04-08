//
//  TodoDetails+CoreDataProperties.swift
//  TodoList
//
//  Created by Palash Roy on 27/02/21.
//
//

import Foundation
import CoreData


extension TodoDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoDetails> {
        return NSFetchRequest<TodoDetails>(entityName: "TodoDetails")
    }

    @NSManaged public var details: String?
    @NSManaged public var id: Int16
    @NSManaged public var isComplete: Bool

    public var wrappedDetails: String{
        details ?? "unknown"
    }
    public var wrappedId: Int16 {
        id ?? 0
    }
    public var wrappedComplete: Bool {
        isComplete ?? false
    }
}

extension TodoDetails : Identifiable {

}
