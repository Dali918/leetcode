# [994. Rotting Oranges](https://leetcode.com/problems/rotting-oranges/)

```python
def orangesRotting(self, grid: List[List[int]]) -> int:
        # get dimensions 
        r, c = len(grid), len(grid[0])
        # define direction vector
        vector = [(0,1), (1,0), (0,-1), (-1,0)]
        #define q 
        from collections import deque
        q = deque([])

        def multi_bfs(level):
            count = 0 
            # peform bfs for each tile in the current level
            for _ in range(level):
                i,j = q.popleft()
                for x,y in vector:
                    x1, y1 = x + i, y + j 
                    #infect if uninfected and adjacent rotten orange
                    if(
                        0 <= x1 < r and
                        0 <= y1 < c and 
                        grid[x1][y1] == 1
                    ):
                        q.append((x1,y1))
                        grid[x1][y1] = 2
                        count+=1
            # return time unit based on number infected
            return int(count and 1)

        # go to each cell and add it to the initial qeue if it has rotten orange
        minutes = 0 
        for i in range(r):
            for j in range(c):
                if grid[i][j] == 2:
                    q.append((i,j))
        
        # infect other oranges in given time unit
        level = len(q)
        while level:
            # do bfs for each rotten orange in current level 
            minutes+= multi_bfs(level)
            # get the length of the next level 
            level = len(q)
            
        # run through grid again and return -1 if you see a 1 
        for i in range(r):
            for j in range(c):
                if grid[i][j] == 1:
                    return -1 
        # return the number of minutes 
        return minutes
```

### Solution Explanation 
- This was an interesting problem, it introduces the idea of 'parallel' computing because you are given a time unit and told to to infect as many other oranges as possible in that time unit. How long it takes to infect all oranges, in other words the total time to infect all oranges is the solution 
- We use BFS in our solution and a qeue. Initially, you want to add all the rotten oranges to the queue to start off the algorithm. 
- Use the idea of 'levels', such that the initial rotten oranges form the first level. For each rotten orange in the current level, infect its neighbors if possible and increment the number of new rotten tomatoes. you will add the new infected oranges to the queue to be processed in the next level. 
- This solution is depended on the count, the number of new rotten tomatoes that you infect per level (which in this case is a time unit). If there are new rotten oranges, then that level corresponds to q time unit.
- Repeat this process increment per time unit or level until you are out of levels. If there are some oranges that are never infected, we have to check this using a traversal of the whole graph, checking to see if we still have a fresh orange and returning -1 if so otherwise returning the total time it takes to infect the whole graph 

#### Runtime Analysis  
- *Time:* $O(n x m) -> $ we traverse the whole graph using BFS and again for checking for fresh oranges
- *Space:* $O(n x m ) -> $ The queue at most could contain all the nodes in the graph if the whole graph is rotten 

### Notes
- Pay attention to the direction vector, had trouble initially because of this 