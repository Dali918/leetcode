# [237 - Delete Node in a Linked List]()

```python
prev, curr = node, node.next
while curr: 
    # swap the node values
    curr.val, prev.val  = prev.val, curr.val 
    # check if you are the tail
    if not curr.next:
        prev.next = None
        return 
    prev = curr
    curr = curr.next
```

### Solution Explanation 
- bubble down the node to be deleted and then detach it i.e make the node the tail 
- use a prev and current pointer, and keep swapping until current is at tail 
- at the tail, swap the values of prev and current, set current to null 

#### Runtime Analysis  
- *Time:* $O(n) \rightarrow$ we might have to traverse the whole linked list if the node to be deleted is at the front  
- *Space:* $O(1) -> \rightarrow$ no extra memory is needed 

