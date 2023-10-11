# [153. Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/)

```python
def findMin(self, nums: List[int]) -> int:
        left, right = 0, len(nums) - 1
        #necessary condition like while left < right 
        while left!=right:
            mid = (left + right)//2 
            # necessary condition for answser like if nums[mid] == key 
            if right == left + 1: 
                return min(nums[left], nums[right])
            if nums[mid] < nums[right]:
                #notice that it is not right = mid-1
                right = mid 
            else:
                #notice that it is not left = mid+1
                left = mid 
        return nums[left]
```

### Solution Explanation 
- we use the fact the array is ordered in ascending order and there are unique elements. This means that if we know the array is not rotated or is rotated `n` times, then `nums[left] < nums[mid] < `nums[right]`
- when `nums[mid] < nums[right]` we know to search the right half since all numbers to the right are greater, otherwise when `nums[mid] > nums[right]` we know to search the left half since that is where the pivot is. 
**Why are we looking for the pivot**
- Usually binary search has to do with finding a specific value using a key, with the answer being found when the left and right pointers of the iterative version overlap. We are guaranteed that at some point they overlap because they are always adjusted to `left = mid + 1` or `right = mid - 1`
- In this case however, we can have a situation where we enter a infinte while loop e.g `[5,1]` will have `left = mid` infinitely, so we have to take the minimum at the pivot point. Hence why the first condition is important. For an array of `n > 1` this condition will always give us an answer
#### Runtime Analysis  
- *Time:* $O(log n)$ since we cut down the problem space all the time 
- *Space:* $O(1)$ since we do not use extra memory space unlike the recursive implementation of this solution 