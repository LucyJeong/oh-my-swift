func foo(x: Int) -> Int {
    return 42 * x
}

let bar = { (x: Int) -> Int in
    return 42 * x
}

//It's same. which one choose it is up to you.

func curly(n: Int) -> Int {
    return n * n
}

func larry(x: Int) -> Int {
    return x * (x+1)
}

func moe(m:Int) -> Int {
    return m * m
}

var stooges = [curly, larry, moe, bar]

for stooge in stooges {
    stooges(42)
}
