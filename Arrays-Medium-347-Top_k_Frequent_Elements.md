# [Top K Frequent Elemnts - Medium](https://leetcode.com/problems/top-k-frequent-elements/)

```python
class Solution(object):
    def topKFrequent(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: List[int]
        """

        """
        First Try
        """

        freq_dict = {}

        for num in nums:
            if freq_dict.get(num, None):
                freq_dict[num]+=1
            else:
                freq_dict[num] = 1

        sorted_by_frequency  = list(freq_dict.items())
        sorted_by_frequency.sort(key= lambda x : -x[1])
        return [sorted_by_frequency[i][0] for i in range(k)]    

```

# Solution Explanation 

### Brute Force 
- 

### Optimized Solution 
- 

# Runtime Analysis  
