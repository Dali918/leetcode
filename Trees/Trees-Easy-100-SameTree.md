# [100. Same Tree](https://leetcode.com/problems/same-tree/)

```python
def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        if not p or not q:
            return not p and not q
        return (
            self.isSameTree(p.left, q.left)
            and
            self.isSameTree(p.right, q.right)
            and
            p.val == q.val
            )

```

### Solution Explanation 
- base case $\rightarrow$ if one of the nodes (left or right) is null, then make sure that they are both null and return the result as a boolean.
- If they are both non empty, check the left subtree of p is equal to the left subtree of q and the same for the right subtree of both (recursive pre-order). Then make sure that their values are equal. return this is as a boolean

#### Runtime Analysis  
- *Time:* $O(n)$ $\rightarrow$ we touch all the nodes 
- *Space:* $O(n)$ $\rightarrow$ by touching all the nodse, we need extra space for them 