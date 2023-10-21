# [19. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)

```python
# left to head, right to head 
        # shift right pointer n times
        # shift right all the way to none, left follows with every shift, prev follow behind left
        # remove node with left pointer
        #init dummy 
        dummy = ListNode()
        dummy.next = head
        prev = dummy 
        left, right = head, head
        #shift right
        for i in range(n):
            if not right:
                break
            else:
                right = right.next
        #find nth last element
        while right:
            right = right.next
            prev = left
            left = left.next
        #delete element
        prev.next = left.next

        return dummy.next

```
### Solution Explanation 
- Using a two pointer method, left and right to head
- shift right pointer n times or until none 
- left to head and prev to dummy and dummy next to head 
- shift right until none 
- delete left with dummy or prev

#### Runtime Analysis  
- *Time:* $O(n)$
- *Space:*  $O(1)$