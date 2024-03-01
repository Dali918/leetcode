# [344. Reverse String](https://leetcode.com/problems/reverse-string/)

```python
 def reverseString(self, s):
        """
        :type s: List[str]
        :rtype: None Do not return anything, modify s in-place instead.
        """
        i,j = 0, len(s)-1
        while i < j:
            s[i], s[j] = s[j], s[i]
            i+=1
            j-=1

```

### Solution Explanation 
- use two pointers one at start and one at end 
- increment start pointer and decrement end pointer, swapping at each iteration until start >= end

#### Runtime Analysis  
- *Time:* $O(n) -> $ we make a swap operation on each data element except for the middle element (if it exists)
- *Space:* $O(1) -> $ no extra memory is needed, swaps happen in place 