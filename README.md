# Oracle SQL Performance Tuning Project

## Overview
This project demonstrates real-world SQL performance tuning techniques in Oracle Database using Oracle XE with very large databases and focuses on understanding Oracle optimizer behavior rather than forcing plan changes.


The goal is to analyze why SQL queries perform poorly, understand Oracle's Cost-Based Optimizer decisions, and apply the correct tuning strategies rather than forcing suboptimal plans.

## Key Topics Covered
- Execution plan analysis using EXPLAIN PLAN and DBMS_XPLAN
- Index selectivity and optimizer behavior
- Statistics and histograms using DBMS_STATS
- Why indexes are sometimes ignored
- Partitioning and partition pruning
- Hash joins vs nested loops

## Environment
- Oracle Database XE 21c
- Oracle SQL Developer
- Schema: PERF_TUNING

## Business Scenario
A simulated Order Management System with large data volumes was used:
- CUSTOMERS (~100K rows)
- ORDERS (~1M+ rows)
- ORDER_ITEMS (~3M rows)

## Project Structure
Each folder represents a step in the tuning lifecycle:
- Environment setup
- Schema design
- Data generation
- Baseline performance analysis
- Index tuning
- Statistics and histogram analysis
- Partitioning strategy
- Final conclusions

## Key Learning Outcome
Indexes alone do not guarantee performance. Understanding data distribution and choosing the correct physical design (such as partitioning) is often the optimal enterprise solution.

---
