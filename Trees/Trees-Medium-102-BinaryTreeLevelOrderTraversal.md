# [102. Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/)

```python
def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        #return list 
        res = []
        #create first level 
        q = [root] if root else []
        while q:
            #add values
            res.append([node.val for node in q])
            #create next level 
            new_q  = []
            for node in q:
                if node.left:
                    new_q.append(node.left)
                if node.right:
                    new_q.append(node.right)
            #udpate the level
            q = new_q
        return res
```

### Solution Explanation 
- at each level, add the node values then create the next level and update the queue
- when the queue is empty, return the result 

#### Runtime Analysis  
- *Time:* $O(n) ->$ we are touching each and every node 
- *Space:* $O(n) ->$ when storing the node values, the same as duplicating the tree 