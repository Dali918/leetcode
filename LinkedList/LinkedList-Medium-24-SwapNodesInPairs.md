# [24. Swap Nodes in Pairs](https://leetcode.com/problems/swap-nodes-in-pairs/description/)

```python
if not head or not head.next:
            return head

sentinel = ListNode()
sentinel.next = head 
a,b,c = sentinel, head, head.next
count = 0
while c:
    if count%2 == 0:
        # a -> b -> c -> ...
        a.next = c # a -> c and b -> c 
        b.next = c.next # a -> c -> ... and b -> ...
        c.next  = b # a -> c -> b -> ....
        b,c = c,b
    a = b
    b = c 
    c = c.next
    count+=1
return sentinel.next

```

### Solution Explanation 
- if the list of length 1 or empty return the head 
- use modulo of two to swap every two steps
- we use three pointers to be able to swap 
- only swap every two steps otherwise move along without swapping 

#### Runtime Analysis  
- *Time:* $O(n) \rightarrow$ traverse all nodes only once
- *Space:* $O(1) -> \rightarrow$ no extra memory is used 