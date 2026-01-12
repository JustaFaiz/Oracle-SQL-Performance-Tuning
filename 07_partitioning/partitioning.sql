/* Now implementation of partition pruning to attempt to lower resource use and expensiveness */

CREATE TABLE orders_part(
order_id NUMBER,
customer_id NUMBER,
order_date DATE,
order_status VARCHAR2(20),
order_amount NUMBER
)
PARTITION BY LIST (order_status)
(
    PARTITION p_completed VALUES ('COMPLETED'),
    PARTITION p_cancelled VALUES ('CANCELLED')
);

INSERT INTO orders_part
SELECT * FROM orders;

commit;           /* Save changes after temporary partition table has been created  */

/* Replace old table */
DROP TABLE orders;
ALTER TABLE orders_part RENAME TO orders;

/* Recreate indexes */
CREATE INDEX idx_orders_cust
ON orders(customer_id)
LOCAL;

/* Gather statistics */
BEGIN 
DBMS_STATS.GATHER_TABLE_STATS(
ownname => 'PERF_TUNING',
tabname => 'ORDERS',
cascade => TRUE
);
END;
/

/* Partition pruning has been successfully implemented */
