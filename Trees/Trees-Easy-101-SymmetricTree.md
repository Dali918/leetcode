# [101 - Symmetric Tree](https://leetcode.com/problems/symmetric-tree/)

```python
def isSymmetric(self, root: Optional[TreeNode]) -> bool:
        """
        - invert left subtree and check if equals to right subtree? 
        - inversion first then checking after
        - inversion and checking at the same time 
        """
        # invert the binary tree 
        if root.left:
            root.left = self.invertTree(root.left)
        # check for subtree symmetry 
        return self.helper(root.left, root.right)
    def helper(self, left: Optional[TreeNode], right: Optional[TreeNode]) -> bool:
        if not left and not right:
            return True
        if not left or not right:
            return False
        if left.val != right.val:
            return False
        # Compare the subtrees for equlity
        return self.helper(left.left, right.left) and self.helper(left.right, right.right)
        

    def invertTree(self, root: Optional[TreeNode]):
        if root is None:
            return None
        root.left, root.right = self.invertTree(root.right), self.invertTree(root.left)
        return root

```

### Solution Explanation 
- first invert any of the subtrees, in this case I invert the left subtree first. Inversion of subtree is arbitrary because if symmetrical inverting one of the two should ensure that after inversion the tree is symmetric. 
- Then, check if each subtree is symmetric about the middle. This check if each left child and right child are the same by level and by left root or right root. i.e start at the top level root, compare the left and right child values, then check if the left subtree of the left child is the same as the subtree of the right child. Do this recursively 

#### Runtime Analysis  
- *Time:* $O(n) \rightarrow$ technically, we take two passes of the left subtree, first via inversion and then during comparision. this is $O(2n)$ but constants don't matter 
- *Space:* $O(n)  \rightarrow$ because this is a recursive solution, we are still doing $O(2n)$ space due to stack space but the constant does not matter. 