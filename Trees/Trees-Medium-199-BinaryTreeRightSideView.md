# [199. Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)

```python
def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        res = [root.val] if root else []
        q = deque([root]) if root else []
        level_len = len(q)
        while q :
            #get the current front
            curr = q.popleft()
            #decrement level length 
            level_len-=1
            # append children left to right 
            if curr.left:
                q.append(curr.left)
            if curr.right:
                q.append(curr.right)
            # check if we have the next level and get the right most child's value
            if level_len == 0  and q:
                level_len = len(q)
                res.append(q[-1].val)

        return res

```

### Solution Explanation 
- Get the right most children on every level 
- Use level len to capture the length of a level and know when to know you are at a new level 

#### Runtime Analysis  
- *Time:* $O(n) -> $ BFS traversal touches all the nodes 
- *Space:* $O(n) ->$ duplicate of data if tree is unbalanced e.g all right children makign it a linked list 