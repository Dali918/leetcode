# [875. Koko Eating Bananas](https://leetcode.com/problems/koko-eating-bananas/description/)

```python
def minEatingSpeed(self, piles: List[int], h: int) -> int:
        left, right = 1, max(piles)
        res = max(piles)
        while left <= right:
            mid = (right + left ) // 2
            curr_total_hours = 0 
            for i in range(len(piles)):
                curr_total_hours+= math.ceil(piles[i]/(mid))
            if curr_total_hours <= h: 
                right = mid - 1
                res = min(res, mid)
            else:
                left = mid + 1
        return res
```

### Quick Note:
- important distinciton for binary search that iteratively, your whlle loop runs while `left <= right` or `right > left ` and *NOT* `left < right`. This is because when left and righ overlap, we still have to check if that number is still the key we are looking for (assuming the traditionala binary search of just finding the key)
- `math.ceil()` function is python rounds up a  division if the result is float 

### Solution Explanation 
- Note that `k` is the hourly rate of consumption where as `h` is the total time limit. Therefore, for a given `k` we want to minimize `math.ceil(i/k)` $-> x s.t x <= h$
- Notice that `h >= len(p)` because at most we can eat a whole pile in 1 hour. if the length of piles is greateer than h, we will not have enough time to eat all the piles e.g given `3,4,5`, and $h=2 -> even with k = 5 or \inf$ we will only be able to eat two piles, and need 3 hours to eat all piles 
- Notice that $max(k) = max(piles)$. From the last two points, the range of k will be $[1....max(k)$
- Brute force is to try every k from 1 to max(k) and the first one that returns a valid total time less than or equal to h is valid. This is $O(max(k) * n)$
- We can perform binary search on the range of k instead -> Start at k = max(piles) and try to left (look for new minimum k ) if the current k is less than or equal to h. Otherwise, simply go right and look for minimum k that gives us a valid where the total hours <= h 

#### Runtime Analysis  
- *Time:* $O(log(max(piles) * n))$
- *Space:* $O(1)$