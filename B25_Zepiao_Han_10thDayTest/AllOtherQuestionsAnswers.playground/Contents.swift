// MARK: Q1 ************************************************

func countCharacters(_ inputString: String) {
    var hashMap: [Character: Int] = [:]
    for ch in inputString {
        if hashMap[ch] == nil {
            hashMap[ch] = 1
        } else {
            hashMap[ch]! += 1
        }
    }
    
    for (key, value) in hashMap {
        print(String(key) + ": " + String(value))
    }
}


// testing Q1
countCharacters("abcdefggfedcba")

// MARK:  Q2 ************************************************

func sort(_ nums: inout [Int], _ l: Int, _ r: Int) {
    if l < r {
        let p = partition(&nums, l, r)
        sort(&nums, l, p-1)
        sort(&nums, p+1, r)
    }
}

func partition(_ nums: inout [Int], _ cLeft: Int, _ cRight: Int) -> Int {
    guard cLeft < cRight else {
        return cLeft
    }

    var l = cLeft + 1
    var r = cRight

    while l <= r {
        if nums[l] > nums[cLeft] && nums[cLeft] > nums[r] {
            nums.swapAt(l, r)
            l += 1
            r -= 1
        } else if nums[l] <= nums[cLeft] {
            l += 1
        } else if nums[r] >= nums[cLeft] {
            r -= 1
        }
    }

    nums.swapAt(cLeft, r)
    return r
}

// testing Q2
var nums: [Int] = [3,4,2,1,5,-1]
sort(&nums, 0, nums.count-1)
print(nums)


// MARK: Q3 ************************************************

/*
 1) Optional. Swift provides optional type variable. It enables the variable to be nil.
 2) Computed property. The value of computed property is assiged or asscessed using get or set methods.
 3) Automatic reference counting. Swift tracks the instances of strong reference, and when these intances are not used any more, they will be freed automatically.
 4) Inheritance, protocol. Class of Swift can inherit from other classes. Class, struct and enum can comform to some protocols.
 5) String. String not only supports elements in ascii code, but also supports almost all the main languages all over the world.
 */

// MARK: My answer to Q4 is an IOS project *****************

// MARK: Q5 ************************************************

let unwrappedNum: Int? = 5
// first way
if let num = unwrappedNum {
    print(num)
}

// second way
if unwrappedNum != nil {
    let num = unwrappedNum!
    print(num)
}

// third way
let num = unwrappedNum ?? 1
print(num)


// MARK: Q6 ************************************************

// My answer: CD

// MARK: Q7 ************************************************

var q7_array = [(3,"google"), (4, "amazon"), ( 5, "facebook")]

func q7Converter(_ input: [(Int, String)]) -> ([Int], [String]) {
    var intArray: [Int] = []
    var strArray: [String] = []
    for item in input {
        let (id, name) = item
        intArray.append(id)
        strArray.append(name)
    }
    
    return (intArray, strArray)
}

// testing Q7
let (fir, sec) = q7Converter(q7_array)
print(fir)
print(sec)


// MARK: Q8 ************************************************

/*
 The value of score1.score is 5. Goals is struct type, which means it's copied by value. Even though the value of score2.score has been changed, the value of score1 is not changed, so it remains 5.
 */
 
// MARK: Q9 ************************************************

// Correct statements are 4 and 5

// MARK: Q10 ************************************************

/*
 A. Question mark. Can be used to unwrapp optional variables. If the optional variable is nil, returns nil.
 B. Can be put after an optional variable with a defaule value, for example: val ?? 1. If the optional variable is nil, return the default value.
 C. Exclamation point. A way to force to unwrap an optional vaviable. If the option variable is nil, the system would meet runtime error.
 D. An iteration operator, return a range. Example use case: 1..<6, will visit 1, 2, 3, 4, 5
 E. An iteration operator, return a range. Example use case: 1...6, will visit 1, 2, 3, 4, 5, 6
 */

// MARK: Q14 ************************************************


let defaults = UserDefaults.standard
if let name = defaults.value(forKey: "name") {
    printString(string: name)
}

func printString(string: String) {
    print(string)
}


// MARK: Answers to Q11, Q12, Q13, Q15, Q16 are IOS projects ************************************************

