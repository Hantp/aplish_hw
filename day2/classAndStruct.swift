class Person {
    var name: String
    var age: Int
    
    init(called name: String, at age: Int ) {
        self.name = name
        self.age = age
    }
}

struct Animal {
    var name: String
    var Color: String
}

var dog = Animal(name: "Wen", Color: "red")