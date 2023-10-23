# [141. Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/)

```python
def hasCycle(self, head: Optional[ListNode]) -> bool:
        slow = head
        # init fast, take care of edge case with empty linked list
        fast = head.next if head else None
        # run while we have not hit a None node
        while slow and fast and fast.next:
            # if the pointers overlap, then you have a cycle
            if slow is fast:
                return True
            #otherwise increment 'fast' faster than 'slow'
            slow = slow.next
            fast = fast.next.next

        return False
```

### Solution Explanation 
- Use Two Pointer
- have two pointers, one slow and one fast
- slow pointer increments by 1, fast pointer increments by 2
- when slow pointer overlaps with fast pointer then you have a cycle otherwise no cycle

#### Runtime Analysis  
- *Time:* $O(n)$
- *Space:* $O(1)$ 