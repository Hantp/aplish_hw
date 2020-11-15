#!/usr/bin/swift

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

var nums: [Int] = [3,4,2,1,5,-1]
sort(&nums, 0, nums.count-1)
print(nums)
