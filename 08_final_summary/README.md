## Final Summary and Key Takeaways

This project explored real-world Oracle SQL performance tuning using a large, skewed dataset and execution plan analysis.  
The objective was not to force faster queries, but to understand *why* Oracle chooses specific execution plans and apply the correct optimization strategy.

---

## Problem Statement

A JOIN query between `CUSTOMERS` and `ORDERS` consistently resulted in:
- Full table scans
- Hash joins
- High cost estimates

Despite filtering on a small subset of data (`RARE_REGION` customers which constituted 10%), Oracle continued to scan large volumes of rows.

---

## Baseline Observations

- The baseline execution plan showed full table scans on large tables.
- Even though the final result returned very few rows, Oracle scanned millions of rows.
- This behavior was driven by missing access paths and data distribution.

---

## Index Tuning Findings

Indexes were created on:
- `customers.region`
- `orders.customer_id`
- `orders.order_status`

After gathering statistics:
- Oracle used the index on `CUSTOMERS`
- Oracle **still chose full table scans on `ORDERS`**

This demonstrated an important principle:
> Indexes are not always used when predicate selectivity is low.

---

## Statistics and Histogram Analysis

Statistics and histograms were gathered to help the optimizer better understand data distribution.

Even with accurate statistics:
- Oracle continued to prefer full table scans
- Hash joins remained the chosen join method

This confirmed that the optimizer was already selecting the least expensive plan based on cost.

---

## Partitioning Strategy (Final Solution)

Since indexing and statistics were exhausted, a physical design change was required.

The `ORDERS` table was:
- Recreated using LIST partitioning on `order_status`
- Partitioned into `COMPLETED` and `CANCELLED` segments

This enabled:
- Partition pruning
- Reduced I/O by scanning only relevant partitions
- Better scalability as data volume grows

The execution plan confirmed:
- `PARTITION LIST SINGLE`
- Only the required partition was accessed

---

## Key Learnings

- Indexes do not guarantee performance improvements
- Oracle’s Cost-Based Optimizer may prefer full table scans when they are cheaper
- Hash joins are often optimal for large datasets
- Partitioning is an effective strategy when query patterns consistently filter on partition keys
- Performance tuning is about reducing work done, not forcing plan changes

---

## Conclusion

This project demonstrates a realistic Oracle SQL tuning workflow:
1. Establish a baseline
2. Test indexing strategies
3. Validate optimizer decisions
4. Apply partitioning when appropriate

The final solution improved scalability and efficiency without relying on optimizer hints or forced execution plans.

