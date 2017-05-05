//: type alias 

typealias Integer = Int

let z: Integer = 42
let zz: Int = 42

// (Int) -> Int 

typealias IntToInt = (int) -> Int

typealias IntMaker = (Void) -> Int

//: Variable Capture at last!!!

func makeCounter()->IntMaker{
    var n = 0
    
    //functions within func????
    //yes we can!
    func adder() -> Int {
        n = n + 1
        return n
    }
    
    return adder
}

let counter1 = makeCounter()
let counter2 = makeCounter()

counter1 //1
counter1 //2
counter1 //3

counter2 //1
counter2 //2 
// captured !

//functions and closure is same thing!
// there are two expression
// func and closures are first class citizens of our language. 
// func and closure capture var defined before the closure or func is defined.

