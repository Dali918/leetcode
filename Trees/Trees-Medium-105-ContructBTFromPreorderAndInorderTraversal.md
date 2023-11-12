# [105. Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)

```python
"""
First Solution -> By Dalitso 
"""
def buildTree(self, preorder: List[int], inorder: List[int]) -> Optional[TreeNode]:
        
        if len(preorder) < 2:
            return TreeNode(preorder[0]) if inorder else None
        root = TreeNode(preorder[0])
        #get left and right sub 
        pivot = inorder.index(preorder[0])
        left_inorder = inorder[:pivot]
        right_inorder = inorder[pivot+1:]
        # make preorder arrays for left and right sub
        left_preorder = preorder[1:pivot+1]
        right_preorder = preorder[pivot+1:]

        root.left = self.buildTree(left_preorder, left_inorder)
        root.right  = self.buildTree(right_preorder, right_inorder)

        return root 

"""
NeetCode Solution
"""
if not preorder or not inorder:
            return None
        
        root = TreeNode(preorder[0])

        mid = inorder.index(preorder[0])
        root.left = self.buildTree(preorder[1:mid+1],inorder[:mid])
        root.right = self.buildTree(preorder[mid+1:],inorder[mid+1:])

        return root

```

### Solution Explanation 
- You construct the tree recursively using the fact that the first node in the preorder is always the root, and preorder deals with the node first before dealing with left subtree and right subtrees. 
- Also use the fact inorder will display nodes in the order of $left < node <= right$.
- Pick node to deal with from preorder, then find its left and right subtree from the inorder array (either from the left part of the array or the right part of the array) and do this recursively until you only have 1 or non elements left in either preorder or inorder array
- notice that **inorder and preorder array must be the samze size at all times** this is true for the recursive calls as well 

#### Runtime Analysis  
- *Time:* $O(log n) -> $ you are splitting the problem space in half everytime using the split of inorder
- *Space:* $O(n) -> $ since you are making a new data structure that must account for all the original data