# [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/) 
```python
def maxProfit(self, prices: List[int]) -> int:
        curr_min = 0
        max_profit = 0
        for i in range(len(prices)):
            if prices[i] > prices[curr_min]:
                max_profit= max(max_profit, prices[i] - prices[curr_min])
            else:
                curr_min = i 
        return max_profit
```

### Solution Explanation 
- Use sliding window using 'two pointers' -> one tracks the current price and the other tracks the current minimum price
- we loop throgh calculating the profit and computing the maximum profit until we find a new current minimum price
- If a new current minimum price is found, we update the current minimum price pointer and repeat  the process -> note that max profit is initialized to zero 
#### Runtime Analysis  
- *Time:* $O(1)$ because we make one pass of the array 
- *Space:* $O(1)$ because we do not use any extra space