# [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)

```python
def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:

        if not list1 or not list2:
            return list1 or list2

        h1, h2 = list1, list2
        if h1.val <= h2.val:
            head = h1
            h1 = h1.next
        else:
            head = h2
            h2 = h2.next
        
        tail  = head 
        while h1 and h2:
            if h1.val <= h2.val:
                tail.next = h1
                tail = h1
                h1 = h1.next 
            else:
                tail.next = h2
                tail = h2
                h2 = h2.next
        if h1:
            tail.next = h1

        else:
            tail.next = h2

        return head 

```

### Solution Explanation 
- We know that the two lists are sorted which means that they are in non decreasing order.
- If either of the lists is null, you return the one that is not null or simply null if they are both empty 
- Determine which list head is going to be the new head and increment its head pointer to the next node in the list 
- You simply have to splice them as you traverse both, adding one node to the new list if it's value is less than the other.
- When you have fully traversed one of the list, you simply append the remaining list 

#### Runtime Analysis  
- *Time:* $O(n) + $O(m)$ since you can end up traversing both lists simultaneously 
- *Space:* $O(1)$ since we do not use any exra space