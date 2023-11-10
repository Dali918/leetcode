# [230. Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/)

```python
def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        # helper function for inorder traversal 
        flat_tree = []
        def inorder_helper(root):
            if root is None:
                return 
            inorder_helper(root.left)
            flat_tree.append(root.val)
            inorder_helper(root.right)
        #flatten tree recusrively 
        inorder_helper(root)
        # return kth element
        return flat_tree[k-1]

```

### Solution Explanation 
- Because its  a BST, an inorder traversal will count all the values in ascending order 
- Flatten the three making an ascending order version of the tree in an array data structure 
- Return the k-1 element since the kth element is 1 indexed 

#### Runtime Analysis  
- *Time:* $O(n) -> $ we touch all the nodes in the tree at most once 
- *Space:* $O(n) -> $ we make a duplicate of the data values in the tree 