//
//  Department+CoreDataProperties.swift
//  DepartmentEmployee
//
//  Created by admin on 10/5/23.
//
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var departmentToEmployee: Set<Employee>?
    
    public var employee: [Employee] {
        let setEmployee = departmentToEmployee
        return setEmployee!.sorted{
            $0.id > $1.id
        }
    }

}

// MARK: Generated accessors for departmentToEmployee
extension Department {

    @objc(addDepartmentToEmployeeObject:)
    @NSManaged public func addToDepartmentToEmployee(_ value: Employee)

    @objc(removeDepartmentToEmployeeObject:)
    @NSManaged public func removeFromDepartmentToEmployee(_ value: Employee)

    @objc(addDepartmentToEmployee:)
    @NSManaged public func addToDepartmentToEmployee(_ values: NSSet)

    @objc(removeDepartmentToEmployee:)
    @NSManaged public func removeFromDepartmentToEmployee(_ values: NSSet)

}

extension Department : Identifiable {

}
