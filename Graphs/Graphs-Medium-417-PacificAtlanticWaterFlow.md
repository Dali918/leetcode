# [417. Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow/)

```python
def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        r, c = len(heights), len(heights[0])
        pacific_atlantic = []
        vector = [(0,1), (1,0), (0,-1), (-1,0)]
        pacific  = [[False for _ in range(c)] for _ in range(r)]
        atlantic  = [[False for _ in range(c)] for _ in range(r)]

        def dfs(i,j, ocean):
            for x,y in vector:
                #calc new vector
                x1,y1 = x + i, y + j
                if (
                    # check if in range
                    0 <= x1 < r and 
                    0 <= y1 < c and 
                    # ocean not marked as true yet
                    not ocean[x1][y1] and
                    heights[x1][y1] >= heights[i][j] 
                ):
                    #mark ocean as true 
                    ocean[x1][y1] = True
                    #perform dfs
                    ocean = dfs(x1,y1, ocean)
            return ocean
        
        # create pacific atlantic table (0 = pacific, 1 = atl, 2 = visit)
        for i in range(c):
            #mark pacific 
            pacific[0][i] = True
            #mark atlantic
            atlantic[r-1][i] = True
        for i in range(r):
            #mark pacific
            pacific[i][0] = True
            #mark atlantic
            atlantic[i][c-1] = True

        for i in range(c):
            #perform horizontal dfs
            pacific = dfs(0,i,pacific)
            atlantic = dfs(r-1,i,atlantic)
            
        for i in range(r):
            #perform vertical dfs
            pacific = dfs(i,0,pacific)
            atlantic = dfs(i,c-1,atlantic)
        # check if pacific and atlantic tile, add tile to return list if true
        for i in range(r):
            for j in range(c):
                if pacific[i][j] and atlantic[i][j]:
                    pacific_atlantic.append([i,j])
        return pacific_atlantic
```

### Solution Explanation 
- This method heavily employs DFS algorithm and adjacency matrix to find the solution
- The naive solution is to go to every cell in the matrix, peform a DFS to find the pacific ocean and peform another DFS to find the atlantic ocean. However, if say the whole matrix is in descending order, then this would be $O([n xm]^2)$ solution. 
- ***With this method, notice that the tiles that are on the edge are already touching the pacific ocean and the atlantic ocean. The solution then becomes a horizontal traversal of the cells touching the pacific ocean and the atlantic ocean, performing a dfs on each cell to see which cells have water flowing from them, and the same for a vertical traversal. The intersection of these traversals (cells that are 'touched' both by the pacific ocean and the atlantic ocean) becomes the solution***

#### Runtime Analysis  
- *Time:* $O(n x m . A) -> $ We dont rerun traversals for already visited cells but we do have to perform DFS which is where the A parameter comes in 
- *Space:* $O(n X m) -> $ We make two adjacency matrices that are the same size as the data 