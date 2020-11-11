func isPrime(num: Int) -> Bool {
    if num <= 1 {
        return false
    }
        

    if num <= 3 {
        return true
    }
        

    var i = 2
    while i*i <= num {
        if num % i == 0 {
            return false
        }
        i = i + 1
    }
        
    return true
}

print(isPrime(num: 13))
