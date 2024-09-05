# [735 - Asteroid Collision](https://leetcode.com/problems/asteroid-collision/description/)

```python
# while non empty stack with top opposite asteroid
def asteroidCollision(self, asteroids):
        stack = []
        for a in asteroids:
            # while non empty stack with top opposite asteroid
            while stack and stack[-1] > 0 and a < 0:
                # if abs(top_stack) < abs(asteroid) -> destroy top, check if next top is destroyed
                if abs(stack[-1]) < abs(a):
                    stack.pop()
                    continue
                #  if abs(top_stack) < abs(asteroid) -> destory both 
                if abs(stack[-1]) == abs(a):
                    stack.pop()
                break
            else:
                # simply append the asteroid
                stack.append(a)
        return stack
```

### Solution Explanation 
- This soluution is from [codepath](https://guides.codepath.com/compsci/Asteroid-Collision)
- Essentially they only pay attention to the fact that the asteroids only collide when they are of different signs. Therefore, you only need to pay attention to negative asteroids while pushing positive asteroids onto the stack all the time (The other way round would have also been possible). However, you need to handle the case that the asteroid incoming is negative. 
- Assuming a collision has occured i.e. the incoming asteroid is negative, you have the cases: 
    - if abs(top_of_stack) > abs(incoming_neg) $\rightarrow$ destroy the incoming asteroid and go to the next asteroid
    -  if abs(top_of_stack) < abs(incoming_neg) $\rightarrow$ destroy the top and keep destroying tops until condition one is satisfied all the stack is empty 
    - if abs(top_of_stack) = abs(incoming_neg) $\rightarrow$ destroy both the top asteroids and incoming, move on to the next negative incomign asteroid
- if the stack is empty or you don't have an incoming negative asteroid hence no collision just append the new asteroid. 
- return the stack when finished 

#### Runtime Analysis  
- *Time:* $O(n) \rightarrow$ you only iterate on the asteroids once
- *Space:* $O(n)  \rightarrow$ the stack could go grow to be all the asteroids since it is the one you return and in the worst case, no asteroids collide