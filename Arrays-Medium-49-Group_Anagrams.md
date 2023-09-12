# [Group Anagrams](https://leetcode.com/problems/group-anagrams/)

```python
class Solution(object):
    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """

        """
        Brute Force Solution 
        """
        # seen = set([])
        # group_anagrams = []

        # def is_anagram(str1,str2):
        #     return(
        #         len(str1) == len(str2)
        #         and 
        #         sorted(list(str1)) == sorted(list(str2))
        #     )

        # for i in range(len(strs)):
        #     if strs[i] in seen:
        #         continue
                
        #     group = [strs[i]]
        #     for j in range(i+1,len(strs)):
        #         if is_anagram(strs[i], strs[j]):
        #             group.append(strs[j])
        #             seen.add(strs[j])
        #     group_anagrams.append(group)

        # return group_anagrams
        """
        Optimized Solution 
        """
        word_dict = {}
        for word in strs:
            key  = ''.join(sorted(word))
            if word_dict.get(key, None):
                word_dict[key].append(word)
            else:
                word_dict[key] = [word]

        return word_dict.values()
```

# Solution Explanation 

### Brute Force 
- 

### Optimized Solution 
- 

# Runtime Analysis
