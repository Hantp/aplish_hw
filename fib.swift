func getFibs(ofSize n: Int) {
    var first = 0
    var second = 1
    
    var fibs: [Int] = []
    for _ in 0..<n {
        fibs.append(second)
        let tmp = second
        second += first
        first = tmp
    }
    
    print(fibs)
}

getFibs(ofSize: 10)
