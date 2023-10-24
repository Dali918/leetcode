# [572. Subtree of Another Tree](https://leetcode.com/problems/subtree-of-another-tree/)

```python
def isSubtree(self, root: Optional[TreeNode], subRoot: Optional[TreeNode]) -> bool:
        #helper same tree function
        def sameTree(p,q):
            if p and q:
                return (
                    p.val == q.val
                    and
                    sameTree(p.left, q.left)
                    and
                    sameTree(p.right, q.right)
                )
            return not p and not q
        # return false if comparing against empty node
        if root is None:
            return False
        # return if same tree or if left tree is same tree or if right tree is same tree
        return (
            sameTree(root, subRoot) 
            or self.isSubtree(root.left, subRoot) 
            or self.isSubtree(root.right, subRoot)  
            )

```

### Solution Explanation 
- utilize the same tree helper function to determine if the current node is the root of a tree that is the same as the comparison node 
- if that is not true, check if the left subtree is the same as the comparsion tree or if the right subtree is the same as the comparison tree 
#### Runtime Analysis  
- *Time:* $O(m * n ) \rightarrow $ where m is the number of nodes in the main tree and n is the number of nodes in the comparison tree. This is because for each node in the main tree, we compare if it is the root of a subtree identicalto the comparison tree. For the comparison tree, we compare againt every node in it 
- *Space:* $O(max(m,n) ) \rightarrow $  since at some point we push the entirety of m or n onto the stack. if the trees are identical $2n \rightarrow n$ then its whatever tree has the most nodes