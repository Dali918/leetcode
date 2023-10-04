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

### Optimized Solution using just two pointers
class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = s.lower()
        is_letter = lambda x : ord(x)>=97 and ord(x)<=122 
        is_number = lambda x : ord(x) >= 48 and ord(x) <= 57
        
        start, end = 0, len(s)-1

        while start <= end:
            if not is_letter(s[start].lower()) and not is_number(s[start].lower()):
                start+=1
            elif not is_letter(s[end].lower()) and not is_number(s[end].lower()):
                end-=1
            elif s[start]!= s[end]:
                return False
            else:
                end -=1
                start+=1

        return True

### Optimized with Neetcode solution 
def isPalindrome(self, s: str) -> bool:

        def is_alpha_numeric(x):
            return(
                ord('a') <= ord(x) <= ord('z') 
                or
                ord('0') <= ord(x) <= ord('9')
            )
        
        start, end = 0, len(s)-1

        while start < end:
            if not is_alpha_numeric(s[start].lower()):
                start+=1
            elif not is_alpha_numeric(s[end].lower()):
                end-=1
            elif s[start].lower()!= s[end].lower():
                return False
            else:
                end-=1
                start+=1

        return True

```

# Solution Explanation 
- We use two pointer method to makae sure that when the two pointers (end and start) cross, or are equal, then we know that we have checked the whole string
- Skip unwanted characaters by simply incrementing or decrementing the pointer when it is not a valid character and holding the other one steady.
- only increment or decrement both pointers when both valid characters are equal 
- you can check if a chaaracter is alpha numeric in python using the `ord` function like so: 
```python
ord('a') <=ord(c) <=ord('z') or ord('0') <=ord(c) <=ord('9')
```
- ***Tip:*** Watch out in string problems for case during comparisons

### Brute Force 
- use the python 'isalnum()' function to determine if a string is alpha-numeric 


### Optimized Solution 
- 

# Runtime Analysis  