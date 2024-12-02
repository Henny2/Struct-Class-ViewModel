import Foundation

// MARK: Open/Closed principle

/*
 Software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification.
 In other words, we can add additional functionality (extension) without touching the existing code (modification) of an object.
 */


// EXAMPLE HOW IT WORKS WITH BUILT IN SWIFT OBJECTS

//extension Int {
//    func squared() -> Int {
//        return self * self
//    }
//}
//
//var num = 2
//num.squared()

struct Invoice {
    let id = NSUUID().uuidString
}


// HOW NOT TO DO IT

//struct InvoicePersistence {
//    let invoice: Invoice
//    func saveInvoiceToCoreData(){
//        //saving to core data
//    }
//    func saveInvoiceToDatabase(){
//        //saving to database
//    }
//}


// if we now added another database, we would have to add another method. That VIOLATES the Oopen/Closed principle (OCP).
// We want to make it extentable

// SOLUTION

protocol InvoicePersistable {
    func save(invoice: Invoice)
}

// THIS IS how to change it to make it follow OCP
struct InvoicePersistence {
    let persistence: InvoicePersistable
    
    func save(invoice: Invoice){
        persistence.save(invoice: invoice)
    }
}





// with this set up, we don't need to keep adding functionality to the InvoicePersistence struct. Instead we extend the functionality, by creating new structures that follow a protocol.
// This also means, OCP does not always mean you have to create literal extensions
// separate structre that conforms to protocol
struct CoreDataPersistence: InvoicePersistable {
    func save(invoice: Invoice) {
        print("Saving invoice to core data \(invoice.id)")
    }
}

struct FireStorePersistence: InvoicePersistable {
    func save(invoice: Invoice) {
        print("Saving invoice to firestore \(invoice.id)")
    }
}

let invoice = Invoice()
let fireStore = FireStorePersistence()
let coreData = CoreDataPersistence()
let persistence = InvoicePersistence(persistence: coreData)
let persistenceF = InvoicePersistence(persistence: fireStore)
persistence.save(invoice: invoice)
persistenceF.save(invoice: invoice)

// Solution in this case is the extension through a protocol
// combination of OCP and SRP
