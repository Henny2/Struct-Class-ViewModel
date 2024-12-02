import Foundation

// MARK: Dependency Inversion Principle (DIP)

/*
    - High-level modules should not depend on low-level modules, but should depend on abstraction
    - If a high-level module imports any low-level module then the code becomes tightly coupled (we want it to be loosely coupled, generic, abstract, more scalable, easier to maintain)
    - Changes in one class could break another class
 */

struct DebitCardPayment {
    func execute(amount: Double){
        print("Debit card payment of \(amount)$")
    }
}

struct StripePayment {
    func execute(amount: Double){
        print("Stripe payment of \(amount)$")
    }
}

struct ApplePayPayment {
    func execute(amount: Double){
        print("Apple pay payment of \(amount)$")
    }
}


// in this set up, the high level module "Payment" depends on a bunch of low-level modules
// violates the DIP
struct Payment {
    var debitCardPayment: DebitCardPayment?
    var stripePayment: StripePayment?
    var applePayPayment: ApplePayPayment?
}


// example debit card payment

let paymentMethod = DebitCardPayment()
let payment = Payment(debitCardPayment: paymentMethod)

payment.debitCardPayment?.execute(amount: 100) // I don't know which payment is defined and which are nil
// eg. they could by accident do
payment.stripePayment?.execute(amount: 100) // which would fail
// ^ this is really messy and not scalable


// SOLUTION, we want to depend on abstraction, we will create a Protocol

protocol PaymentMethod {
    func execute(amount: Double)
}


struct DebitCardPayment: PaymentMethod {
    func execute(amount: Double){
        print("Debit card payment of \(amount)$")
    }
}

struct StripePayment: PaymentMethod {
    func execute(amount: Double){
        print("Stripe payment of \(amount)$")
    }
}

struct ApplePayPayment: PaymentMethod {
    func execute(amount: Double){
        print("Apple pay payment of \(amount)$")
    }
}



// now our high level module (PaymentDIP) depends on an abstraction (protocol) instead of low level modules (low level structs)
struct PaymentDIP {
    let paymentMethod: PaymentMethod
    
    func makePayment(amount: Double){
        paymentMethod.execute(amount: amount)
    }
}

let stripe = StripePayment()
let paymentDIP = PaymentDIP(paymentMethod: strip)
paymentDIP.makePayment(amount: 100)
