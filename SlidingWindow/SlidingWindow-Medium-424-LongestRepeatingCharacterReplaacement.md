# [424. Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/description/)

```python
def characterReplacement(self, s: str, k: int) -> int:
        freq_table = {}
        start = 0 
        max_length=0
        curr_max_freq=0
        for i in range(len(s)):
            #update all  current frequencies (add new character)
            if freq_table.get(s[i]):
                freq_table[s[i]] +=1
            else:
                freq_table[s[i]] = 1
            # get the max freq of character in window
            for key in freq_table:
                curr_max_freq = max(curr_max_freq, freq_table[key])
            #udpdate the max window length if the window is valid 
            if i - start + 1 - curr_max_freq <= k:
                max_length = max(max_length, i - start + 1)
            else: 
                freq_table[s[start]]-=1
                start +=1

        return max_length

```

### Solution Explanation 
- Use a mixture of sliding window and hashtable to solve this one
- The current window length, and the maximum charcter frequency (character that appears the most in that window) are most important -> make sure that you in that current window, you can replace at most k characters with the character with the most frequency in that window -> if not decrease the window, window otherwise icnerase the window 
- Note that you have to update the maximum character frequency for every addition of a charcter in the hashtable or for each new current window 

#### Runtime Analysis  
- *Time:* $O(26 * n)$ because of max char freq update -> $O(n)$
- *Space:* $(n)$ because of the hashtable 