# [110. Balanced Binary Tree](https://leetcode.com/problems/balanced-binary-tree/)

```python
def isBalanced(self, root: Optional[TreeNode]) -> bool:
    """
    for each node, check if abs(left subtree length - right subtree length) < 1
    """
    if root is None:
        return True 
    left = self.helper(root.left)
    right = self.helper(root.right)

    return abs(left - right) <=  1 and self.isBalanced(root.right) and self.isBalanced(root.left)

def helper(self, root: Optional[TreeNode]):
    if root is None:
        return 0 
    return max(self.helper(root.left) + 1, self.helper(root.right) + 1)

```

### Solution Explanation 
- Get the depth of each subtree for every node 
- This solution has repetion and is slow because for every node, we have to recompute the depth of its subtree even if it was already computed before. 
- the `helper` function helps us with computing the depth of every subtree

#### Runtime Analysis  
- *Time:* $O(n) -> $ We compute the depth of eaach node's subtree everytimne all over again 
- *Space:* $O(n) -> $ Extra memory is allocated for the algorithm becaues it is recursive