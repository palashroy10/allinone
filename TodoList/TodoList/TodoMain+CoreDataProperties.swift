//
//  TodoMain+CoreDataProperties.swift
//  TodoList
//
//  Created by Palash Roy on 27/02/21.
//
//

import Foundation
import CoreData


extension TodoMain {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoMain> {
        return NSFetchRequest<TodoMain>(entityName: "TodoMain")
    }

    @NSManaged public var color: String?
    @NSManaged public var icon: String?
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var item: NSOrderedSet?
    
    public var wrappedColor: String {
        color ?? "unknown"
    }
    public var wrappedIcon: String {
        icon ?? "unknown"
    }
    public var wrappedId: Int16 {
        id ?? 0
    }
    public var name: String {
        name ?? "Unknown"
    }
    
    public var itemArray : [TodoDetails]{
        let set = td as set<TodoDetails> ?? []
        return set.sorted{
            $0.id < $1.id
        }
    }

}

// MARK: Generated accessors for item
extension TodoMain {

    @objc(insertObject:inItemAtIndex:)
    @NSManaged public func insertIntoItem(_ value: TodoDetails, at idx: Int)

    @objc(removeObjectFromItemAtIndex:)
    @NSManaged public func removeFromItem(at idx: Int)

    @objc(insertItem:atIndexes:)
    @NSManaged public func insertIntoItem(_ values: [TodoDetails], at indexes: NSIndexSet)

    @objc(removeItemAtIndexes:)
    @NSManaged public func removeFromItem(at indexes: NSIndexSet)

    @objc(replaceObjectInItemAtIndex:withObject:)
    @NSManaged public func replaceItem(at idx: Int, with value: TodoDetails)

    @objc(replaceItemAtIndexes:withItem:)
    @NSManaged public func replaceItem(at indexes: NSIndexSet, with values: [TodoDetails])

    @objc(addItemObject:)
    @NSManaged public func addToItem(_ value: TodoDetails)

    @objc(removeItemObject:)
    @NSManaged public func removeFromItem(_ value: TodoDetails)

    @objc(addItem:)
    @NSManaged public func addToItem(_ values: NSOrderedSet)

    @objc(removeItem:)
    @NSManaged public func removeFromItem(_ values: NSOrderedSet)

}

extension TodoMain : Identifiable {

}
