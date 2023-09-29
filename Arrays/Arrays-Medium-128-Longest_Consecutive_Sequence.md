# [Longest Consecutive Sequence - Medium](https://leetcode.com/problems/longest-consecutive-sequence/)

```python
### Optimized Code by Dalitso ####
nums_set = set(nums)
        max_length = 0
        for i in range(len(nums)):
            if nums[i] - 1 not in nums_set:
                curr_num = nums[i]
                curr_length = 0
                while(curr_num in nums_set):
                    curr_length +=1
                    curr_num +=1

                max_length = max(curr_length, max_length)
        return max_length

```

# Solution Explanation 

### Brute Force 
- 

### Optimized Solution 
- 

# Runtime Analysis  