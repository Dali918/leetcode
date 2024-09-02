# [933 - Number of Recent Calls]()

```python
def __init__(self):
        self.requests = deque([])
        
def ping(self, t: int) -> int:
    """
    - value of t is > t previous 
    - range of return is [t-3000, t]
    - use a queue to process:
        - add to queue 
        - top > = min queue range -> return len(queue)
        - otherwise pop while queue top < min queue range
    """
    self.requests.append(t)
    min_range = t - 3000
    while self.requests[0] < min_range:
        self.requests.popleft()
    return len(self.requests)

```

### Solution Explanation 
- they tell us that for a ping to be counted, it has to be in the range `[t - 3000, t]` inclusive and that it is guaranteed that each `t` that comes next, it will be greater than the previous.
- that means that we have an ordered queue of items in non-decreasing order and we just have to make sure that the top element in the queue is > the `min_range` value. Once this is satisfied, we know that all the elements following are in the range specified because the newest added element is `t` itself

#### Runtime Analysis  
- *Time:* $O(n) \rightarrow$  The while loop touches every data element in the worst case
- *Space:* $O(n) \rightarrow$ The queue stores the entire data queue in the worst case