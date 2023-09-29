# [Rotate List - 61 - Medium](https://leetcode.com/problems/rotate-list/)
```python
  def rotateRight(self, head, k):
        """
        :type head: ListNode
        :type k: int
        :rtype: ListNode
        """
        if not head:
            return None
        length, tail = 1,head
        while tail.next:
            length+=1
            tail= tail.next
        k =k%length
        
        if k==0:
            return head
        
        curr = head
        for i in range(length - k -1):
            curr = curr.next
        newHead = curr.next
        curr.next = None
        tail.next = head
        return newHead
```

### Explanation
### Runtime
