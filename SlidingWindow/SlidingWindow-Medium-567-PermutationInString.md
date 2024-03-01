# []()

```python

"""
First Attempt with sorting: slow 
----
"""
def checkInclusion(self, s1, s2):
        """
        :type s1: str
        :type s2: str
        :rtype: bool
        """
        valid = sorted(s1)
        for i in range(len(s2)):
            if sorted(s2[i:i + len(s1)]) == valid:
                return True
        return False

"""
Second Attempt without sorrting: faster
"""





```

### Solution Explanation 

#### Runtime Analysis  
- *Time:* $O() -> $
- *Space:* $O(1) -> $ 