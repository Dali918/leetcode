### [isPalindrome - 234 - Easy](https://leetcode.com/problems/palindrome-linked-list/)

```python
## Paste your code in here
def isPalindrome(self, head):
        """
        :type head: ListNode
        :rtype: bool
        """
        if head is None:
            return True
        h1,h2 = head, None
        while h1:
            node = ListNode(h1.val)
            node.next = h2
            h2 = node
            h1 = h1.next
        h1 = head
        while h1 and h2:
            if h1.val != h2.val:
                return False
            h1 = h1.next
            h2 = h2.next
        return True
```

### Explanation

- $O(n)$ for time complexity we iterate through the entire original linked list of size $n$ twice but it is not a double nested loop
- $O(n)$  for space complexity because we recreate the original linked list for comparison
