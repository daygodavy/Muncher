func findMin(_ nums: [Int]) -> Int {
    
    var l: Int = 0
    var r: Int = nums.count - 1
    var minVal: Int = .max

    while l <= r {
        print(nums[l])
        print(nums[r])
        if nums[l] < nums[r] {
            minVal = min(nums[l], minVal)
            break
        }

        let mid: Int = Int(Double((l + r) / 2).rounded(.up))
        let midVal: Int = nums[mid]

        minVal = min(minVal, midVal)
        print("minVal: \(minVal)")
        print("======")

        if midVal >= nums[l] {
            // search right
            l = mid + 1
        } else {
            // search left
            r = mid - 1
        }
    }

    return minVal
}

var nums = [4,5,1,2,3]
findMin(nums)
