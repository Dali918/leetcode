# [Valid Parenthesis - 20 - Easy](https://leetcode.com/problems/valid-parentheses/)
```python
def isValid(s):
        """
        :type s: str
        :rtype: bool
        """
        
        closers = {"}":"{", ")":"(", "]":"["}
        stack = []
        for char in s:
            if len(stack) > 0 and (char in closers) and closers[char] == stack[-1]:
                stack.pop()
            else:
                stack.append(char)
        return len(stack)==0

def test(test_bench):
    for test in test_bench:
        print(isValid(test))

test_bench = ["()", "()[]{", "(]", "]", "()[]{}"]
test(test_bench)
```

### Solution Explanation

- Create hashmap mapping closing parenthesis to corresponding opening parenthesis
- start with empty stack
- loop through string and
    - remove from  the stack if you encounter closing parenthesis and the stack is non empty and the top of the stack corresponds to the opening character of the encountered closing character
    - add to the stack otherwise (opening charater or empty stack)
- when the algorithm is done, the parenthesis is valid if the stack is empty and all opening characters have been popped off (matched)

### Runtime

- $O(n)$ for time because the algorithm loop through the input sequentially, $O(1)$  for space because the hashmap does not scale with input size
