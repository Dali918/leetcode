# [Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/description/)

```python
def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        if not root:
            return None
        # post order inversion 
        self.invertTree(root.left)
        self.invertTree(root.right)
        # invert at current node
        root.left, root.right  = root.right, root.left


        return root
```
--- 
- Use post order inversion to invert every subtree
- swap the left and right node and return recursively 
- [video solution](https://www.youtube.com/watch?v=2zLM6K1RItQ)

```python
def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
    # return nothing if the root is empty 
    if root is None:
        return None
    # recursively swap the right subtree and the left subtree 
    root.left, root.right = self.invertTree(root.right), self.invertTree(root.left)
    # at each level after subtree inversion, return the root 
    return root
```

----
- For the second solution, we simply just swap subtrees recursively 
- There is a base case where the root is none. when this is true we are at the leaf nodes which have no children or an empty tree so we return none
- if we were at the lead nodes, one layer above the none return, left and right children will be set to none and we simply return the child node
- if our tree had a minimum of two layers, the two left and right subtrees are swapped with the assignment statement and we return the root node to be swapped in the recusion layer above. 

#### Runtime Analysis  
- *Time:* $O(n)$ because at most we touch each and every node
- *Space:* $O(n)$ because at most, we have to add each and every node to the stack because we are using recursion 