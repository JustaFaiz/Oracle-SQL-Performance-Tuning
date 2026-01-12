SHOW USER;

/* Create relevent tables to input data */

CREATE TABLE customers(
customer_id NUMBER,
customer_name VARCHAR2(100),
region VARCHAR2(30),
signup_date DATE);

CREATE TABLE orders(
order_id NUMBER,
customer_id NUMBER,
order_date DATE,
order_status VARCHAR2(20),
order_amount NUMBER);

CREATE TABLE order_items(
order_item_id NUMBER,
order_id NUMBER,
product_id NUMBER,
quantity NUMBER,
price NUMBER);
