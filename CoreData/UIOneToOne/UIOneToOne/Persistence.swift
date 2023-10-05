//
//  Persistence.swift
//  UIOneToOne
//
//  Created by admin on 10/3/23.
//

import CoreData

class PersonModel{
    public var email: String?
    public var phones: PhoneModel?
}

class PhoneModel{
    public var number: String?
}

class PersistenceController: ObservableObject {

    static let shared = PersistenceController()
    @Published var savedPerson: [Person] = []
    @Published var savedPhone: [Phone] = []
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "UIOneToOne")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        fetchPerson()
        fetchPhone()
    }
    
    func fetchPerson() {
        let request = NSFetchRequest<Person>(entityName: "Person")
        do {
            savedPerson = try container.viewContext.fetch(request)
        } catch {
            print("Error in Fetching : ",error)
        }
    }
    
    func fetchPhone() {
        let request = NSFetchRequest<Phone>(entityName: "Phone")
        do {
            savedPhone = try container.viewContext.fetch(request)
        } catch {
            print("Error in Fetching : ",error)
        }
    }
    
    func isPersonExist(email: String) -> Bool {
        for person in savedPerson {
            if( person.email == email ) { return true }
        }
        return false
    }
    
    func isPhoneExist(number: String) -> Bool {
        for phone in savedPhone {
            if( phone.number == number ) { return true }
        }
        return false
    }
    
    func getPhone(number: String) -> Phone {
        for phone in savedPhone {
            if(phone.number == number) { return phone }
        }
        return Phone()
    }
    
    func addPerson(person: PersonModel) -> String {
        if(!isPersonExist(email: person.email ?? "")){
            let newPerson = Person(context: container.viewContext)
            print("Person's Phone: \(person.phones?.number)")
            print(addPhone(phone: person.phones ?? PhoneModel()))
            newPerson.email = person.email
            if(isPhoneExist(number: person.phones?.number ?? "")){
                newPerson.phones = getPhone(number: person.phones?.number ?? "")
            }
            saveData()
            fetchPhone()
            fetchPerson()
            return "Saved Person !!!!!"
        }else { return "Person Already Exists !!!!!" }
        
    }
    
    func addPhone(phone: PhoneModel) -> String {
        if(!isPhoneExist(number: phone.number ?? "")){
            let newPhone = Phone(context: container.viewContext)
            newPhone.number = phone.number
            saveData()
            fetchPhone()
            fetchPerson()
            return "Phone Saved !!!!!"
        }else{ return "Phone Already Exists !!!!!"}
    }
    
    func deletePerson(person: Person) -> Bool {
        if(isPersonExist(email: person.email ?? "")){
            container.viewContext.delete(person)
            saveData()
            return true
        }
        return false
    }
    
    func deletePhone(phone: Phone) -> Bool {
        if(isPhoneExist(number: phone.number ?? "")){
            container.viewContext.delete(phone)
            saveData()
            return true
        }
        return false
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch {
            print("Error in saving data: ",error)
        }
    }
    
}
