# [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)

```python
def numIslands(self, grid: List[List[str]]) -> int:
        if not grid:
            return 0
        #visited
        visited = set()
        #init result
        res = 0 
        #init rows, cols
        row, col = len(grid), len(grid[0])
        #bfs helper
        def bfs(r,c):
            directions = [[-1, 0], [1,0], [0,-1],[0,1]]
            q = deque()
            q.append((r,c))
            visited.add((r,c))
            while q:
                x,y = q.popleft()
                #calculate vectors
                for dx, dy in directions:
                    x_next, y_next = x + dx, y + dy
                    if (
                        0 <= x_next < row and 0 <= y_next < col and
                        grid[x_next][y_next] == "1" and 
                        (x_next,y_next) not in visited
                    ):
                        q.append((x_next,y_next))
                        visited.add((x_next,y_next)) 
       
    
        #BFS on every tile
        for i in range(row):
            for j in range(col):
                if grid[i][j] == "1" and (i,j) not in visited:
                    bfs(i,j)
                    res+=1       
        return res
```

### Solution Explanation 
- Perform BFS on every tile checking to see if it is an island 
- note you only perform BFS when the string is a "1" and also if you have not visited it 
- note that you perfomr basic error checking in the beginning 
- for some reason, this solution passes when you visit in the for loop body not when you pop from the queue 
#### Runtime Analysis  
- *Time:* $O(m x n) -> $ visit every tile 
- *Space:* $O(m x n) -> $ if the whole thing is an island then you visit every island