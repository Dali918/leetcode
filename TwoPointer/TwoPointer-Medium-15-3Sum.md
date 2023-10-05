# [15-3Sum](https://leetcode.com/problems/3sum/)

```python
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        nums.sort()
        res =[]
        for index, value in enumerate(nums):
            if index > 0 and nums[index-1] == value:
                continue
            start, end = index + 1, len(nums)-1
            while start < end:
                current_sum = value + nums[start] + nums[end]
                if current_sum > 0 :
                    end-=1
                elif current_sum < 0:
                    start+=1
                else:
                    res.append([value, nums[start], nums[end]])
                    start+=1
                    while nums[start] == nums[start-1] and start < end:
                        start+=1

        return res

```

### Solution Explanation 
- This is a variation of two sum extended to three sum
- first start off with sorting the array, just like the initial problem in ***Two Sum II***
- loop through the array and for each element that you have not seen before (since sorted, then current element!=previous element will work unless you are at the start of the array) then perform two sum on the remaining elements in range to find 3sum 
- updating the left pointer is important when you do find a 3sum to avoid duplicate solutions e.g consier the case of ***[-2,0,0,2,2]*** -> study the code to understand why the else block takes care of this condition 

### Runtime Analysis  
- *Time:* $O(nlogn)$ for sorting but since we have that two sum while loop, we then have $O(nlogn) + On(^2) = $O(n^2)$
- *Space:* $O(1)$ but some sorting algorithms take $O(n)$ space 