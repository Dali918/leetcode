# [207. Course Schedule](https://leetcode.com/problems/course-schedule/)

```python
def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        pre  = {i: [] for i in range(numCourses)}
        visited = set()
        for c,p in prerequisites:
          pre[c].append(p)
        print(pre)
        def dfs(c):
          # if already seen return False 
          if c in visited: return False
          # a coures with no prereqs can be taken
          if pre[c] == []: return True
          # visit the course in the recursion chain
          visited.add(c)
          # dfs on every neighbor, return False if prereq loop
          for p in pre[c]:
            if not dfs(p): return False
          # for disjointed graphs remove 
          visited.remove(c) 
          # for faster return next time make this empty 
          pre[c] = []
          return True

        # check if course can be taken using dfs
        for c in range(numCourses):
          if not dfs(c): return False 
        return True
```

### Solution Explanation 
- I originally miunderstood this question as one askng whehter it is possible to take a certain number of courses, however it is simply asking if we  are able to take all the main courses without courses need each other as prerequisites $->$ misunderstanding came from the fact that main courses  are labelled by an integer that is in the range of `numCourses` so `[0,1,2....numCourses -1 ]`. The goal is to determine if each of these courses can be taken without a loop in the prerequisites, that is a course is not a prerequisite of any of its prerequisites
**IMPORTANT:** Read the question before answering!
- create adjacency list with courses and their prerequisites
- go through each required course and do a dfs on it making sure its prerequisite chain does not have a loop as mentioned earlier
- Accomplish this in the dfs by:
    - check if the current course  in the recursion has been visited $->$ return false if so, we have a loop ***BASE CASE*****
    - check if the current course does not have a prerequisites $->$ return true, we can take this course ***BASE CASE***
    - for all prerqusisted reursively do the same thing  and return False if any one of them return false
    - if the current course's prerequisites can all be taken then it can also be taken. you can return true:
        - extra work is to make this have no prerequisites, fast return of true 
        - remove it from visited because some courses in the required courses may have the same prerequisites but not be connected e.g `3 -> 2, 1->2` this should return true but would return false if we did not clear visited after doing dfs 

#### Runtime Analysis  
- *Time:* $O(n + p ) -> $ we visit all the required courses and the dfs on prerequisites adds the p 
- *Space:* $O(p) -> $ for the recursive element 