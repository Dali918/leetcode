# []()
### My solution 

```python
def get_length(head):
            count = 0 
            while head: 
                count +=1
                head = head.next
            return count

        #get length of linked list
        length = get_length(head) 
        # return if length <=2 
        if length <= 2:
            return 
        mid = length //2
    # reverse for node >= mid + 1 and mark tail
        prev, curr = head, head.next
        count = 1
        tail = None
        while curr:
            count+=1
            if count > mid:
                if not curr.next:
                    tail = curr
                n  = curr.next
                curr.next = prev 
                prev = curr
                curr = n
            else:
                prev = curr
                curr = curr.next
    # while tail is not current 
    #   get next node -> n
    #   set curr.next to tail
    #   set tail to tail.next 
    #   set curr -> n 
    # set tail next to null 
    # linked list is now reversed
        curr = head 
        while tail is not curr:
            n = curr.next
            curr.next = tail
            tail = tail.next
            curr.next.next = n
            curr = n
        tail.next = None
```

### Neetcode Solution
```python
#find middle
        slow, fast = head, head.next 
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next

        #split the list into two halves
        second = slow.next 
        slow.next = None
        prev = None
        #reverse the second half
        while second:
            n = second.next
            second.next = prev
            prev = second
            second = n 
        #set the heads of the two lists
        first, second = head, prev
        #merged the two lists 
        while second:
            tmp1, tmp2 = first.next, second.next
            first.next = second
            second.next = tmp1
            first, second = tmp1, tmp2
```

### Solution Explanation 
- You basicaly have two halves of the linked list (split into the middl)
- Get the middle of the linked list using slow and fast pointers
- reverse the second half of the linked list
- merge the second half with the first half by interleaving

#### Runtime Analysis  
- *Time:* $O(n)$
- *Space:* $O(1)$