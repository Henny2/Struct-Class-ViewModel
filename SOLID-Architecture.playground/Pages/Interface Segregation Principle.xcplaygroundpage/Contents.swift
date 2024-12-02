import Foundation

// MARK: Interface Segregation Principle (ISP)

/*
 Do not force any client to implement an interface which is irrelevannt to them
 */

protocol GestureProtocol {
    func didTap()
    func didDoubleTap()
    func didLongPress()
}

struct SuperButton: GestureProtocol {
    func didTap(){
        
    }
    
    func didDoubleTap() {
        
    }
    
    func didLongPress() {
        
        
    }
}


// this violates the protocol because it forces the button to have functionality it does not need
struct DoubleTapButton: GestureProtocol {
    func didTap(){}
    
    // BUT I ONLY REALLY NEED THIS FUNCTION
    func didDoubleTap() {
        print("DOUBLE TAP")
    }
    
    func didLongPress() {}
}


// SOLUTION: Break up the protocol and only use what's necessary


protocol SingleTapProtocol {
    func didTap()
}

protocol DoubleTapProtocol {
    func didDoubleTap()
}

protocol LongPressProtocol {
    func didLongPress()
}



struct SuperButton2: SingleTapProtocol, DoubleTapProtocol, LongPressProtocol {
    func didTap(){
        
    }
    
    func didDoubleTap() {
        
    }
    
    func didLongPress() {
        
        
    }
}


// now irrelevant functions/methods are not needed anymore
struct DoubleTapButton: DoubleTapProtocol {
    // BUT I ONLY REALLY NEED THIS FUNCTION
    func didDoubleTap() {
        print("DOUBLE TAP")
    }
}
