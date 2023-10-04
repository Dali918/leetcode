# [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)

```python
class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        low, high = 0, len(numbers) - 1
        while low < high:
            if numbers[low] + numbers[high] == target:
                return [low+1, high+1]
            if numbers[low] + numbers[high] < target:
                low += 1
            else:
                high -=1

```

# Solution Explanation 
- since the array is sorted, use two pointer to start from end of array and start of array (pointer locactions).
- Increment start pointer if the current sum is too small, and decrement end pointer if the sum is too big while the left pointer < right pointer
- return indices accordingly 

# Runtime Analysis  
- $O(n)$ for runtime, one pass through the array 
- $O(1)$ for space, no extra space is used 