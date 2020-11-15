func sort(_ nums: inout [Int], _ l: Int, _ r: Int) {
    guard l < r else {
        return
    }
    let p = l + (r - l) / 2
    sort(&nums, l, p)
    sort(&nums, p+1, r)

    var tmp: [Int] = []
    var i = l
    var j = p+1
    while i <= p && j <= r {
        if nums[i] < nums[j] {
            tmp.append(nums[i])
            i += 1
        } else {
            tmp.append(nums[j])
            j += 1
        }
    }

    while i <= p {
        tmp.append(nums[i])
        i += 1
    }

    while j <= r {
        tmp.append(nums[j])
        j += 1
    }

    j = 0
    for i in l...r {
        nums[i] = tmp[j]
        j += 1
    }
}

var nums: [Int] = [3,4,2,1,5,-1]
sort(&nums, 0, nums.count-1)
print(nums)
