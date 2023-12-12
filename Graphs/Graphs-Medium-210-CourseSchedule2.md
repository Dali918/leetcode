# [210. Course Schedule 2](https://leetcode.com/problems/course-schedule-ii/)

```python
def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        # initialize adj list 
        premap = {i : [] for i in range(numCourses)}
        visited, taken = set(), set()
        output  = []
        # dfs function
        def dfs(c, visited):
            # return true if course already taken
            if c in taken:
                return True 
            # return false if cycle detected
            if c in visited:
                return False
            # mark the current course visited 
            visited.add(c)
            # recursivley take prereqs
            for p in premap[c]:
                if not dfs(p, visited): return False
            # remove from set and add to visited and taken 
            visited.remove(c)
            taken.add(c)
            output.append(c)
            return True 

        # populate with neighbors 
        for c,p in prerequisites:
                premap[c].append(p)
        # create ouput list 
        for i in range(numCourses):
            if not dfs(i,set()): return []
        return output
```

### Solution Explanation 
- This function uses topological sort for graphs which works ong graphs that works on DAGs without cycles. We just have to sort the graph topologically and then return the ouput list 
- similar to course schedule I, init an adjacency list first with key value pairing of course and its prereqs (population of prereqs happens in line 29). 
- Use two sets, viisted and taken, to keep of track of a course being already taken or in the current cycle 
- The dfs recursively checks if the course is already taken(returns true), if it is in the current cycle (returns false, you cannot take a course and its prereq at the same time), and then recursively does the same for neighbors
- if no neighbors exist, then it simply marks the course taken and adds it to the output list. notice that we also remove the course from the cycle list if other courses have it as a prereq but it is not in a cycle. 
- Courses already taken are not checked twice with the help of the taken set 

#### Runtime Analysis  
- *Time:* $O(n + e) -> $ we visit every node and edge in the graph atleast twice 
- *Space:* $O(n + e) -> $ the visit and taken set store the graph nodes and the adj list needs all the edges and nodes too 