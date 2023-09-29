# [Find Pivot in Index](https://leetcode.com/problems/find-pivot-index/) 

```python
  def pivotIndex(nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        l_sum,r_sum =0,0
        totalSum = sum(nums)
        for i in range(len(nums)):
            r_sum = totalSum - nums[i] - l_sum
            if r_sum == l_sum:
                return i
            l_sum+=nums[i]
        return -1
            
```
### Explanation

- We utilize the fact that :  $rightSum + leftSum + valueAt Pivot =  totalSum$ .
- From this equation we can solve for the right sum and find that $rightSum = totalSum  - rightSum - valueAtPivot$
- in every iteration we check the condition $rightSum == leftSum$. If this is true then we have found the pivot
- We start off by finding a sum of all the values in the array
- starting off with the initial sums both 0, we loop from the left of the array to the right in one pass checking to see if the left sums and the right sums match.
    - If they do match then the pivot has been found and we have found the pivot index
    - if they do not match then we keep looking for the pivot index in the right subarray adn increment the left sum by the value at the curent index

### Runtime Analysis

- $O(n)$ for time complexity since we loop through all elements at worst
- $O(1)$ for space since processing is done in place and no extra space is made for the data