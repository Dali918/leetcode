# [Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)

```python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        if len(s) == 1:
            return True
        
        s = s.lower()
        is_letter = lambda x : ord(x)>=97 and ord(x)<=122 
        is_number = lambda x : ord(x) >= 48 and ord(x) <= 57
        clean_string = ''.join([char.lower() for char in s if is_letter(char.lower()) or is_number(char.lower())])

        print(clean_string)

        start, end = 0, len(clean_string)-1

        while start <= end:
            if clean_string[start]!= clean_string[end]:
                return False
            end -=1
            start+=1

        return True

```

# Solution Explanation 

### Brute Force 
- 

### Optimized Solution 
- 

# Runtime Analysis  