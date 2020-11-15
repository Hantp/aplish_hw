func sort(_ nums: inout [Int], _ l: Int, _ r: Int) {
    guard nums.count > 1 else {
        return
    }

    for i in l...r {
        var lowest = i
        for j in stride(from: i+1, through: r, by:1) {
            if nums[j] < nums[lowest] {
                lowest = j
            }
        }

        nums.swapAt(i, lowest)
    }
}

var nums: [Int] = [3,4,2,1,5,-1]
sort(&nums, 0, nums.count-1)
print(nums)
