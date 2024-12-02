import Cocoa


struct User {
    var name: String
    var age: Int
    
    mutating func changeName(newName: String){
        self.name = newName
    }
    
    func test() {
        var myself = User(name: "Henny", age: 28)
        myself.changeName(newName: "Robert")
    }
}

var myself = User(name: "Henny", age: 28)
myself.name
myself.name = "Robert"
myself.name
