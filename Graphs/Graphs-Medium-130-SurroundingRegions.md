# [130. Surrounding Regions](https://leetcode.com/problems/surrounded-regions/)

```python
def solve(self, board: List[List[str]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        r, c  = len(board), len(board[0])
        vector = [(0,1), (1,0), (0,-1), (-1, 0)]
        # define dfs
        def dfs(i,j):
            board[i][j] = "T"
            for x,y in vector:
                x1,y1 = x + i, j + y 
                if (
                    0 <= x1 < r and
                    0 <= y1 < c and 
                    board[x1][y1] == 'O' 
                ):
                    dfs(x1,y1)
        #perimeter change using dfs 
        # horizontal sweep 
        for i in range(c):
            if board[0][i] == "O":
                dfs(0,i)
            if board[r-1][i] == "O":
                dfs(r-1,i)
        # vertical sweep 
        for i in range(r):
            if board[i][0] == "O":
                dfs(i,0)
            if board[i][c-1] == "O":
                dfs(i,c-1)
        print(board)
        # change O's to X's and T's to O's
        for i in range(r):
            for j in range(c):
               board[i][j] = "O" if board[i][j] == "T" else "X"

```

### Solution Explanation 
- regions are only unsurrounded when they a touch an 'O' cell on perimeter
- first do dfs on perimeter with O's and change them to T
- change all cells that are O's (not touching a perimeter cell) to X
- change back all the T's to O's 
- you have a solution 

#### Runtime Analysis  
- *Time:* $O(n x m . A) -> $ full board traversal at the end touches all cells where as the the dfs adds the factor of A for all cells it touches per dfs
- *Space:* $O(n x m) -> $ the dfs algorithm is recursive so if the whole board is full of O's then the whole board is pushed to recursion stack 