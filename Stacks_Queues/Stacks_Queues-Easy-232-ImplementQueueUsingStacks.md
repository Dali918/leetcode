# [232 - Implement Queue Using Stacks](https://leetcode.com/problems/implement-queue-using-stacks/)

```python
def __init__(self):
        self.stack_one = []
        self.stack_two = []
        

def push(self, x: int) -> None:
    self.stack_one.append(x)
    
def pop(self) -> int:
    if not self.empty():
        while self.stack_one:
            self.stack_two.append(self.stack_one.pop())
        elem = self.stack_two.pop()
        while self.stack_two:
            self.stack_one.append(self.stack_two.pop())
        return elem
    return -1

def peek(self) -> int:
    if not self.empty():
        return self.stack_one[0]
    return -1


def empty(self) -> bool:
    return len(self.stack_one) == 0

```

### Solution Explanation 
- pop uses the two stacks to first get the top of the queue in stack one and then reflect the new state of the queue after popping. We have to do $O(n)$ operations in this part 


#### Runtime Analysis  
- *Time:* $O(n) \rightarrow$ we touch all elemens when popping
- *Space:* $O(n)  \rightarrow$ we use the stack to store data elements 