# [1174. Remove Zero Consecutive Sum Nodes from Linked List](https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/description/?envType=daily-question&envId=2024-03-12)

```python
dummy = ListNode()
dummy.next = head 
start, end = dummy, dummy.next
while start:
    prefix = 0
    end = start.next
    while end:
        prefix += end.val
        if prefix == 0:
            start.next = end.next 
        end = end.next
    start = start.next
return dummy.next

```

### Solution Explanation 
- consider the entire range first, and adjust the starting point until looping from the starting point to a certain point yields a zero sum sequence. 

#### Runtime Analysis  
- *Time:* $O(n^2) \rightarrow$ similar to double for loop 
- *Space:* $O(1) \rightarrow$  no extra memory needed 