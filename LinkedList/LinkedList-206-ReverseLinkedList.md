# [Reverse Linked List - 20 - Easy](https://leetcode.com/problems/reverse-linked-list/)

```python
    def reverseList(head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        prev = None
        curr = head
        while curr:
            temp_next = curr.next
            curr.next = prev
            prev = curr
            curr = temp_next
        return prev
```

### Explanation
- use two pointers, previous and curr, pointing to `none` and `head` respectively. This means that prev is always one node behind head
- for each iteration of of the traversal, get the next node (curr.next) and save it to a temporary variable. then set the current node's next to its previous node. This will essentially reverse the sub-list between current and prev nodes. 
- Make the current node previous and the save "next" node current. Repeate the process until current points to none
- return prev, the last node which is now the new head 

### Runtime
- $O(n)$ for time complexity because we perform a linear traversal

- $O(1)$ for space complexity because we reverse the linked list in place

