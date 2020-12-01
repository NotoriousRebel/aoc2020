import sequtils
# Given expense report find two entries that sum to 2020

import strformat

var nums = @[1721, 979, 366, 299, 675, 1456]
var dupNums = nums
const targetNum = 2020

for i in 0..len(nums)-1:
    let curNum = nums[i]
    keepIf(dupNums, proc(x: int): bool = x + curNum == targetNum)
    if len(dupNums) == 1:
       dupNums.add(curNum)
       echo fmt"Numbers within dupNums equal {targetNum} and dupNums is: {dupNums}"
       break
    dupNums = nums
    