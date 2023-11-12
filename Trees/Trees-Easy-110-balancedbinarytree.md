# [110. Balanced Binary Tree](https://leetcode.com/problems/balanced-binary-tree/)

```python
"""
My initial solution
"""
def isBalanced(self, root: Optional[TreeNode]) -> bool:

        def get_depth(root):
            if root is None:
                return 0
            return max(get_depth(root.left), get_depth(root.right)) + 1 
        
        if root is None:
            return True 
        
        left_depth = get_depth(root.left) if root.left else 0
        right_depth = get_depth(root.right) if root.right else 0

        if abs(left_depth-right_depth) > 1:
            return False 
        else:
            return self.isBalanced(root.left) and self.isBalanced(root.right)

```

### Solution Explanation 
- Perform a DFS at every node and see if it is balanced
- The `get_depth` method helps us perform a DFS  at every node inorder to determine the depth and then compare the two 

#### Runtime Analysis  
- *Time:* $O(nlogn) -> $ The DFS at every node slows us down 
- *Space:* $O(1) -> $ No extra memory is allocated for the algorithm 