class Heap {
    private var nums: [Int]

    init(_ arr: [Int]) {
        // nums = arr
        
        for n in arr {
            add(n)
        }

        // for i in (0 ... (nums.count/2 - 1)).reversed() {
        //     var small = i

        //     if (i * 2 + 1) < nums.count && nums[i*2+1] < nums[small] {
        //         small = i*2 + 1
        //     }

        //     if i*2+2 < nums.count && nums[i*2+2] < nums[small] {
        //         small = i*2+2
        //     }

        //     if small != i {
        //         nums.swapAt(small, i)
        //     }
        // }
    }

    func add(_ num: Int) {
        nums.append(num)
        var i = nums.count - 1
        
        while i > 0 {
            if nums[i] < nums[(i-1)/2] {
                nums.swapAt(i, (i-1)/2)
                i = (i-1)/2
            } else {
                break
            }
        }
    }

    private func heapify() {
        var i = 0
        while i*2+1 < nums.count {
            if i*2+1 < nums.count && nums[i] > nums[2*i+1] {
                nums.swapAt(i, 2*i+1)
                i = 2*i+1
            } else if i*2+2 < nums.count && nums[i] > nums[2*i+2] {
                nums.swapAt(i, 2*i+2)
                i = 2*i+2
            } else {
                break
            }
        }
    }

    func empty() -> Bool {
        return nums.count == 0
    }

    func next() -> Int {
        return nums[0]
    }

    func pop() {
        nums.swapAt(0, nums.count-1)
        nums.removeLast()
        heapify()
    }
}

func sort(_ nums: inout [Int]) {
    let h = Heap(nums)

    var i = 0
    while !h.empty() {
        nums[i] = h.next()
        h.pop()
        i += 1
    }
}

var nums: [Int] = [3, 2, 4, -3, 3, 10000]
sort(&nums)
print(nums)
