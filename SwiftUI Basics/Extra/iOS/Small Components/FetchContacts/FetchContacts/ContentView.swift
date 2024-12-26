//
//  ContentView.swift
//  FetchContacts
//
//  Created by admin on 4/22/24.
//

import SwiftUI
import Contacts

class ContactModel: Identifiable {
	var id = UUID()
	var firstName: String
	var lastName: String
	var phoneNumber: String
	init(firstName: String, lastName: String, phoneNumber: String) {
		self.firstName = firstName
		self.lastName = lastName
		self.phoneNumber = phoneNumber
	}
}

struct ContentView: View {
	@State private var allContacts: [ContactModel] = []
    var body: some View {
        VStack {
			List(allContacts) { contact in
				Text(contact.firstName + " " + contact.lastName)
			}
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
		.onAppear {
			Task {
				allContacts = await fetchContacts()
			}
//			Task.init {
//				await fetchContacts()
//			}
//			fetchContacts()
		}
    }
	
//	func fetchContacts() async {
//		let store = CNContactStore()
//
//		let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
//
//		let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
//		do {
//			try store.enumerateContacts(with: fetchRequest) { contact, result in
//				print("First name = \(contact.givenName)")
//			}
//		} catch {
//			print("ERROR in ")
//		}
//	}
	
	
	func fetchContacts() async -> [ContactModel] {
		var contacts: [ContactModel] = []

		//Get access to the Contacts store
		let store = CNContactStore()
		// Specify which data keys you want to fetch
		let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]

		// Create fetch request
		let fetchRequest = CNContactFetchRequest(keysToFetch: keys)

			//Call method to fetch all contacts
			do {
				try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, result in
					for number in contact.phoneNumbers {
						switch number.label {
						case CNLabelPhoneNumberMobile, CNLabelPhoneNumberMain:
							contacts.append(ContactModel(firstName: contact.givenName, lastName: contact.familyName, phoneNumber: number.value.stringValue))
						default:
							print("PermissionViewModel::fetchContacts: No number found in Mobile and Main")
						}
					}
				})
			} catch {
				print("PermissionViewModel::fetchContacts: Error in fetching contacts")
			}
		return contacts
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
