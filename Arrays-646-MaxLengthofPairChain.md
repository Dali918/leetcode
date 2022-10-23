# [ Maximum Length of Pair Chain](https://leetcode.com/problems/maximum-length-of-pair-chain/) 

```python def findLongestChain(self, pairs):
        """
        :type pairs: List[List[int]]
        :rtype: int
        """
        
        pairs.sort(key  = lambda x: x[1])
        longest_chain = [pairs[0]]
        j = 0
        for i in range(len(pairs)):
            if pairs[i][0] > pairs[j][1]:
                longest_chain.append(pairs[i])
                j = i
        return len(longest_chain)
```

### Explanation
- Recall that pairs are in the form `[a,b]` such that `b>a`
- We first sort the array in ascending order using the distinct upper bound (`b`)of the pairs as the keys. This ensures that we can linearly obtain pairs that do not overlap while having them follow the sequence `[a,b],[c,d]` such that `b>a, d>c` and `c>b`
- In the for loop, we start with **the longest chain** containing the pair with the smallest end bound. 
- In each iteration, we check to see if the next element to add to the chain does not overlap with the **current pair at the end of the chain**. This is done by checking to see if the current pair's starting bound is greater than the end bound of the pair at the end of the chain. If this is true, we add it to the chain. We also update `j`, a variable tracking the **sorted array index** of the pair at the end of the chain
- When done looping through the sorted array, we return the length of **longest chain array**  
### Runtime Analysis 
- $O(nlogn)$ or $O(n^2)$for runtime complexity since the sort adds some overhead complexity but python's sorting algorithm is $O(nlogn)$. We also iterate over the entire list a second time to make it $O(n)$ but $O(nlogn)$ is bigger
- $O(n)$ for space complexity since we create a new array containing the longest maximum chain pair. This means that at worst you  can have the entire original array be a valid chain pair array  