# []()

```python
def cloneGraph(self, node: Optional['Node']) -> Optional['Node']:
        # for empty node return nothing
        if not node:
            return None
        #build adjacency list 
        from collections import deque 
        adj_list = {}
        visited = set()
        q = deque([node])
        while q:
            curr = q.popleft()
            visited.add(curr.val)
            adj_list[curr.val] = []
            for n in curr.neighbors:
                if n.val not in visited and n not in q:
                    q.append(n)
                adj_list[curr.val].append(n.val)
        #rebuild graph with hash 
        graph = {}
        for val in adj_list:
            #make copy in new graph 
            if val not in graph:
                graph[val] = Node(val)
            #make copies of neighbor
            for n in adj_list[val]:
                #create neighbor node if not in new graph
                if n not in graph:
                    graph[n] = Node(n)
                #append neighbors
                graph[val].neighbors.append(graph[n])
        return graph[node.val]

```

### Solution Explanation 
- This solution is heavily based on the fact that there are no duplicates in the graph and that it is connected
- We also employ two data structures: a queue and a hashtable 
- first create an adjacency list using BFS (This is where  you employ a qeue), key value pairing being key = node value and value = list of neighbor values 
- using the adjacency list, you can create a new graph 
    - for each key in the adj list $->$ create key value pairing in the *graph* st key = node value and value is the node (distinct values help us here)
    - for each 'neighbor' in the adj. list for that key, create a node for it in the new graph if needed then append it to current nodes' neighbor list 

#### Runtime Analysis  
- *Time:* $O(V + E) -> $ we visit all the nodes and edges of the graph 
- *Space:* $O(V + E) -> $ for the adjacency list, $O(V)$ for the hashmap, and  $O(V + E)$ for the BFS queue 