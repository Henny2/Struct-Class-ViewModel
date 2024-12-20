import Cocoa

// https://www.youtube.com/watch?v=lsGGz5XWWLk
// MARK: Single Responsibility Principle (SRP)

/*
 A class should only be responsible for one thing.
 */

// this violates the SPR because the struct is responsible for multiple things:
// 1. Getting a total
// 2. Printing out an invoice
// 3. Persisting the invoice (i.e. saving it to some storage)


// HOW NOT TO DO IT

//struct Product {
//    let price: Double
//}
//
//struct Invoice {
//    var products: [Product]
//    let id = NSUUID().uuidString
//    var discountPercentage: Double = 0
//    
//    var total: Double {
//        let total = products.map({$0.price}).reduce(0, {$0 + $1})
//        let discountedAmount = total * (discountPercentage/100)
//        return total-discountedAmount
//    }
//    
//    func printInvoice() {
//        print("--------------------------")
//        print("Invoice ID: \(id)")
//        print("Total costs: \(total)")
//        print("Discounts: \(discountPercentage)")
//        print("--------------------------")
//    }
//    
//    func saveInvoice() {
//        // save invoice data locally or to database
//    }
//}
//
//let products: [Product] = [
//    .init(price: 99.99),
//    .init(price: 10.20),
//    .init(price: 25.60)
//]
//
//let invoice = Invoice(products: products, discountPercentage: 20)
//invoice.printInvoice()



// How to change it to make it adhere to the principle


//struct Product {
//    let price: Double
//}
//
//struct Invoice {
//    var products: [Product]
//    let id = NSUUID().uuidString
//    var discountPercentage: Double = 0
//    
//    var total: Double {
//        let total = products.map({$0.price}).reduce(0, {$0 + $1})
//        let discountedAmount = total * (discountPercentage/100)
//        return total-discountedAmount
//    }
//
//}
//
//// single responsibility of persisting the invoice
//struct InvoicePersistence {
//    let invoice: Invoice
//    func saveInvoice() {
//        // save invoice data locally or to database
//    }
//}
//
//// Single responsibility of printing the invoice
//struct InvoicePrinter {
//    let invoice: Invoice
//    func printInvoice() {
//        print("--------------------------")
//        print("Invoice ID: \(invoice.id)")
//        print("Total costs: \(invoice.total)")
//        print("Discounts: \(invoice.discountPercentage)")
//        print("--------------------------")
//    }
//}
//
//let products: [Product] = [
//    .init(price: 99.99),
//    .init(price: 10.20),
//    .init(price: 25.60)
//]
//
//let invoice = Invoice(products: products, discountPercentage: 20)
//let printer = InvoicePrinter(invoice: invoice)
//let persistence = InvoicePersistence(invoice: invoice)
//printer.printInvoice()
//persistence.saveInvoice()
//
//
//// drawback of this approach is that you have to create new structs for each invoice
//let invoice2 = Invoice(products: products)
//let printer2 = InvoicePrinter(invoice: invoice2)
//let persistence2 = InvoicePersistence(invoice: invoice2)
//printer2.printInvoice()
//persistence2.saveInvoice()



// Option 3 - MORE SCALABLE
// Logic is still in sub classes


struct Product {
    let price: Double
}


struct Invoice {
    var products: [Product]
    let id = NSUUID().uuidString
    var discountPercentage: Double = 0
    
    var total: Double {
        let total = products.map({$0.price}).reduce(0, {$0 + $1})
        let discountedAmount = total * (discountPercentage/100)
        return total-discountedAmount
    }
    
    func saveInvoice() {
        let persistence = InvoicePersistence(invoice: self)
        persistence.saveInvoice()
    }
    
    func printInvoice(){
        let printer = InvoicePrinter(invoice: self)
        printer.printInvoice()
    }
}

// single responsibility of persisting the invoice
struct InvoicePersistence {
    let invoice: Invoice
    func saveInvoice() {
        // save invoice data locally or to database
    }
}

// Single responsibility of printing the invoice
struct InvoicePrinter {
    let invoice: Invoice
    func printInvoice() {
        print("--------------------------")
        print("Invoice ID: \(invoice.id)")
        print("Total costs: \(invoice.total)")
        print("Discounts: \(invoice.discountPercentage)")
        print("--------------------------")
    }
}

let products: [Product] = [
    .init(price: 99.99),
    .init(price: 10.20),
    .init(price: 25.60)
]

let invoice = Invoice(products: products, discountPercentage: 20)
invoice.printInvoice()
invoice.saveInvoice()
