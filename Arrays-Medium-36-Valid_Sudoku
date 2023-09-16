# [Valid Sudoku - Medium](https://leetcode.com/problems/valid-sudoku/description/)

```python
class Solution(object):
    def isValidSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: bool
        """
        from collections import defaultdict

        row_hash = defaultdict(lambda : set([]))
        col_hash = defaultdict(lambda : set([]))
        sub_hash = defaultdict(lambda : set([]))
                
        for i in range(len(board)):
            for j in range(len(board[i])):
                val = board[i][j]
                if val == ".":
                    continue 
                if val in row_hash[i] or val in col_hash[j] or val in sub_hash[(i/3, j/3)]:
                    return False
                else:
                    row_hash[i].add(val)
                    col_hash[j].add(val)
                    sub_hash[(i/3, j/3)].add(val)

        return True 

```

# Solution Explanation 

### Brute Force 
- 

### Optimized Solution 
- 

# Runtime Analysis  