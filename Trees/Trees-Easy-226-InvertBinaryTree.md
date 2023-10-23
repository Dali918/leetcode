# [Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/description/)

```python
def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        if not root:
            return None
        # post order inversion 
        self.invertTree(root.left)
        self.invertTree(root.right)
        # invert at current node
        root.left, root.right  = root.right, root.left

        return root
```

### Solution Explanation 
- Use post order inversion to invert every subtree
- swap the left and right node and return recursively 
- [video solution](https://www.youtube.com/watch?v=2zLM6K1RItQ)

#### Runtime Analysis  
- *Time:* $O(n)$ because at most we touch each and every node
- *Space:* $O(n)$ because at most, we have to add each and every node to the heap 