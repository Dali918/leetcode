# [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)

```python
def maxDepth(self, root: Optional[TreeNode]) -> int:
        if root is None:
            return 0 
        else:
            return max(self.maxDepth(root.left),self.maxDepth(root.right)) + 1

```

### Solution Explanation 
- recursively return the depth of each path and only select the path that has the maximum depth 
- when we hit a null node, we return a length of 0 
- otherwise we have to return the max depth by counting the depth in the left subtree, as well as the depth in the right subtree. We then select the greatest one and return 1 + the maximum (add 1 becuse we also count the current node to add to the length)

#### Runtime Analysis  
- *Time:* $O(n)$ because we touch every node in the tree when counting the depth until we arrive to leaf nodes 
- *Space:* $O(n)$ because use a recursive algorithm that pushes every node onto the stack until the leaves of leaf nodes (null nodes) are discovered. 