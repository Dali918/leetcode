# [98. Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree/)

```python
def isValidBST(self, root: Optional[TreeNode]) -> bool:
        """
        My naive solution 
        """
        def inorder_helper(root,values):
            if root.left:
                values = inorder_helper(root.left, values)
            values.append(root.val)
            if root.right:
                values = (inorder_helper(root.right, values))
            return values

        values = inorder_helper(root,[])
        #determine if only on value 
        if len(values) == 1:
            return True 
        #determine if values are inorder
        for i in range(1,len(values)):
            if values[i] <= values[i-1]:
                return False

        return True

        """
        Implementation after neetcode video explanation 
        """

        def helper(root, lower, upper):
            if root is None:
                return True 
            return (
                root.val < upper
                and root.val > lower
                and helper(root.left, lower, root.val)
                and helper(root.right, root.val, upper)
            )

        return helper(root,float("-inf"), float("inf"))

```

### Solution Explanation 
 - In the first solution, if the BST is valid, an inorder traversal of the BST will lead to ascending order serialiazation of the list $->$  do an inorder traversal and look for where the order breaks (by traversing a list)
 - In the second solution, you know that the root value can be any value between negative inf and positive inf. As you go left, you adjust the upper limit to be the parent (since values in the left tree are strictly less than the parent value) and as you go right, you adjust the lower limit to be the parent (since values in the right tree are strictly greater than the parent value)
- You can use recursion to accomplish this 
#### Runtime Analysis  
- *Time:* $O(n)$ for both solutions althought technically $O(2n)$ for the first solution 
- *Space:* $O(n)$ for the first solution since we make a copy of values in the tree and represent them as a serialized list and $O(1)$ for the second solution since we do not make any copies