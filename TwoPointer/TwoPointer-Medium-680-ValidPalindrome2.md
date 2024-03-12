# [680. Valid Palindrome 2](https://leetcode.com/problems/valid-palindrome-ii/description/)

```python
def check_palindrome(s,l,r,count):
    while l<r:
        if s[l] != s[r]:
            return (
                count < 1 
                and 
                (check_palindrome(s,l,r-1, count + 1)
                or 
                check_palindrome(s,l+1,r, count + 1))
            )
        else:
            l+=1
            r-=1
    return True
l,r, count = 0, len(s)-1, 0
return check_palindrome(s,l,r,count)
```

### Solution Explanation 
- use counter and two pointer 
- while loop to loop through using left and right pointer checking each other to see if characters in a string are equal. Return true at the end when left pointer > right pointer 
- if two characters are not equal, recurse with count incremented and return the recursive result and the count limit has not been exceeded. This returns false otherwise
#### Runtime Analysis  
- *Time:* $O(n) \rightarrow$ we traverse though the whole string
- *Space:* $O(1) \rightarrow$ for space if youre not considering stack space for the function calls