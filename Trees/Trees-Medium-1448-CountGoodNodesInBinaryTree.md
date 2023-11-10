# [1448. Count Good Nodes in Binary Tree](https://leetcode.com/problems/count-good-nodes-in-binary-tree/)

```python
def goodNodes(self, root: TreeNode) -> int:
        def helper(root, max_seen):
            if root is None:
                return 0 
            if root.val < max_seen:
                return helper(root.left, max_seen) + helper(root.right, max_seen)
            else:
                return helper(root.left, root.val) + helper(root.right, root.val) + 1

        return helper(root, float(-inf))
```

### Solution Explanation 
- simply traverse using post order. make sure that when you are traversing, you are updaating the maximum seen on that path so that the children of the current node have the right current maximum seen
- if the value of the current node is less than the current maximum seen on that path, then dont count the node as a good node, otherwise count it as a good node. Do this recursively 
- base case is that an empty node returns a 0 count 

#### Runtime Analysis  
- *Time:* $O(n) -> $ we touch every node 
- *Space:* $O(1) -> $ no extra memory is needed for solution since computation is done during traversal