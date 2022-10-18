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