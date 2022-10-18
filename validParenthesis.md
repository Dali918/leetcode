### Solution Explanation

- Create hashmap mapping closing parenthesis to corresponding opening parenthesis
- start with empty stack
- loop through string and
    - remove from  the stack if you encounter closing parenthesis and the stack is non empty and the top of the stack corresponds to the opening character of the encountered closing character
    - add to the stack otherwise (opening charater or empty stack)
- when the algorithm is done, the parenthesis is valid if the stack is empty and all opening characters have been popped off (matched)

### Runtime

- $O(n)$ for time because the algorithm loop through the input sequentially, $O(1)$  for space because the hashmap does not scale with input size