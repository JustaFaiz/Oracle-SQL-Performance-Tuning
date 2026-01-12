## Partitioning Strategy

List partitioning is implemented on order_status to enable partition pruning.

This reduces unnecessary data scans and improves scalability for large datasets.

Partitioning cannot be done directly on existing tables so temporarily table is created after which the originals are replaced
