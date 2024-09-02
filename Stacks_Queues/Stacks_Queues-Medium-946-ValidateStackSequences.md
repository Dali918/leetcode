# [946 - Validate Stack Sequnces](https://leetcode.com/problems/validate-stack-sequences/description/)

```python
def validateStackSequences(self, pushed: List[int], popped: List[int]) -> bool:

        """
        - init our own stack 
        - tracker in pushed section 
        - iterate popped section 
            - try to pop from our stack 
                - cannot pop -> load from pushed section and try again if pushed not empty 
                - can pop -> pop from stack and go to next popped 
        - when the stack is empty is when we can return true 
        """

        stack = []
        p1 = 0 
        for i in range(len(popped)):
            current = popped[i]
            if stack and stack[-1] == current:
                stack.pop()
            else:
                while p1 < len(pushed):
                    stack.append(pushed[p1])
                    p1+=1
                    if stack[-1]== current:
                        stack.pop()
                        break
        return len(stack) == 0
```

### Solution Explanation 
- We try to validate the operations of the stack using just pushed and popped values served in the form of a list. 
- I try to mimic how the pushed values would be manipulated in such a way that when popped they also give us the order of the popped values. I use my own stack to try and achieve the same operations that would yield the the popped values. This validation is contingent on the fact that the stack is a LIFO data structure, and the fact that the pushed and popped values are the same size with unique elements. 
- Essentially, I iterate through the popped values and for each value try to pop it in two ways:
    - if our initialized stack is not empty, try to pop from it and move to the next value in the popped list. 
    - If this is not possible, e.g stack is empty or stack top is not the current popped value, I will push values from the pushed list onto the stack until the top stack value is the same as the current popped value or will iterate through the whole pushed value list. In the case that the top stack value matches the current popped element, we simply pop the stack value, stop the while loop and move on to the next popped element. 
- since pushed and popped lists are the same size, the number of elements pushed on our stack should be the same as the number of elemlents popped hence if our stack is validated, the final stack size should be 0 

#### Runtime Analysis  
- *Time:* $O(n) \rightarrow$ we process all the elements of popped list and pushed list only once, and they are the same size n 
- *Space:* $O(n)  \rightarrow$ our stack could grow to be all the elements in the in the pushed list which is extra storage for them 