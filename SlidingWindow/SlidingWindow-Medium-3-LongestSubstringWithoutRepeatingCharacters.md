# [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/submissions/?source=submission-noac)

```python
def lengthOfLongestSubstring(self, s: str) -> int:
        max_length = 0 
        start=0
        curr_set = set("")
        for i in range(len(s)):
            if s[i] in curr_set:
                max_length = max(max_length, len(curr_set))
                while s[i] in curr_set and start < len(s):
                    curr_set.remove(s[start])
                    start+=1
                curr_set.add(s[i])
            else:
                curr_set.add(s[i])
        return max(max_length, len(curr_set))
```

### Solution Explanation 
- we utilize a starting pointer to initialize the start of the current substring (start at 0)
- We add to the set as long as we see a new character that is not in the set 
- when we see a new character that is in the set (a repeating character), we simply keep removing characters from the current substring until we have removed the character that has been repeated (removing from the set and incrementing our starting pointer). 
- Note that we first update the ***max length*** of the current longest substring if needed every time we hit a repeating character
- We also update the ***max length*** of the current longest substring at the end if we dont hit a new repeating character at the end of the string e.g *"rs|suvwhmnop"*

#### Runtime Analysis  
- *Time:* $O(n)$ -> we do this in one pass and we visit each character in the string at least once 
- *Space:* $O(n)$ -> the set that is used uses extra space of at at least size $n$