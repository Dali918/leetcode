# [695. Max Area of Island](https://leetcode.com/problems/max-area-of-island/)

```python
class Solution:
    def maxAreaOfIsland(self, grid: List[List[int]]) -> int:
        visited = set()
        size = 0 
        r,c = len(grid), len(grid[0])
        vector = [(0,1), (1,0), (0,-1), (-1,0)]
        #dfs helper
        def dfs(tile):
            visited.add(tile)
            size = 0 
            for x,y in vector:
                x1, y1 = x + tile[0], y + tile[1]
                if (0 <= x1 < r and
                    0 <= y1 < c and 
                    (x1,y1) not in visited and 
                    grid[x1][y1] == 1
                ):
                    size += dfs(tile=(x1,y1))
            return size + 1
            
        #body 
        for i in range(len(grid)):
            for j in range(len(grid[0])):
                if grid[i][j] == 1 and (i,j) not in visited:
                    #perform dfs and update size
                    size = max(dfs(tile = (i,j)), size)
        
        return size
```

### Solution Explanation 
- we use a set, dfs, and grid function 
- traverse through the whole grid tile by tile
    - perform dfs and update size on the tile if it is not visited i.e a new island
- return the size of the maximum island 

#### Runtime Analysis  
- $m =  $ row size and $n = $ column size
- *Time:* $O(m * n + A) -> $ the graph is m x n and we visit each cell but we also do a traversal at each cell using dfs. If most of the graph is an island, then we would peform O(A) for dfs, with A being the size of all nodes. 
- *Space:* $O(m * n ) -> $ the dfs needs extra memory using a stack and at worst, whole graph is an island, we would have the whole graph on the stack 