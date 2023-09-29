# [Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self/)

```python
class Solution(object):
    def productExceptSelf(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        #####Brute Force#####
        # output_array = []
        # for i in range(len(nums)):
        #     product = 1
        #     for j in range(len(nums)):
        #         if i!=j:
        #             product*=nums[j]

        #     output_array.append(product)
        # return output_array 
        ####Optimized#####

        #intialize output array
        output_array =[1]
        # compute prefix array 
        for i in range(len(nums)-1):
            output_array.append(output_array[-1] * nums[i])

        # compute answer from post fix array 
        curr_post = 1
        for i in range(len(nums)-1,-1,-1):
            output_array[i] = curr_post * output_array[i]
            curr_post *= nums[i]

        return output_array
```

# Solution Explanation 

### Brute Force 
- 

### Optimized Solution 
- 

# Runtime Analysis  