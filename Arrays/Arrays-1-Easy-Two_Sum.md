# [Two Sum - Easy](https://leetcode.com/problems/two-sum/)

```python
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """

        #### Brute Force #####
        # for i in range(len(nums)):
        #     for j in range(i+1, len(nums)):
        #         if nums[i] + nums[j] == target:
        #             return [i,j]

        ### Optimized - first solution ###
        # if len(nums) == 2:
        #     return [0,1]

        # pair = [(value, index) for index, value in enumerate(nums)]
        # pair.sort(key= lambda x : x[0])
        # print(pair)
        # low, high = 0, len(nums) - 1
        # while(True):
        #     if pair[low][0] + pair[high][0] == target:
        #         return [pair[low][1], pair[high][1]]
        #     elif pair[low][0] + pair[high][0] > target:
        #         high -= 1
        #     else:
        #         low += 1

        ### Optimized - second solution ###

        nums_dict = {}
        for i in range(len(nums)):
            diff = target - nums[i]
            if diff in nums_dict:
                return [i, nums_dict[diff]]
            nums_dict[nums[i]] = i 

```

# Solution Explanation 

### Brute Force 
- 

### Optimized Solution 
- 

# Runtime Analysis  