# [235. Lowest Common Ancestor of a Binary Search Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/)

```python
def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        # dfs for p storing path 
        # dfs for q storing path 

        def dfs_helper(root, p, q):
            if root.val == p:
                return root
            if root.val == q:
                return root 
            if root.val > p and root.val > q:
                return dfs_helper(root.left, p, q)
            elif root.val < p and root.val < q:
                return dfs_helper(root.right, p, q)
            else: return root

        return dfs_helper(root, p.val, q.val)

```

### Solution Explanation 
- Find where they split! the paths of the given p and q will be the same until they diverge, you just have to find that ancestor
- Use DFS for this 

#### Runtime Analysis  
- *Time:* $O(logn) -> $ The search for the ancestor is similar to look up in a BST which is $O(logn)$
- *Space:* $O(1) -> $  we do not use any extra memory 