# Superstore Sales and Profitability Analysis (SQL)

SQL analysis of 5,898 retail sales records across 2018–2019 to find what drives sales and profit, evaluate regional performance, customer profitability, and identify areas where the business loses money using DB Browser for SQLite.

---

## Business Questions
- How do sales, profit, and margin differ by category, sub-category, region, and state?
- Which product sub-categories and states lose money?
- How do sales and profit progress year-over-year (2018 vs. 2019)?
- Who are the top revenue-generating customers and how do they rank across regions?

---

## Datasets
The project utilizes three datasets covering transactions from 2018 through 2019:
1. `sales_2018.csv` (2,586 records) – Order lines from 2018 detailing date, order ID, category, sub-category, product, quantity, sales, discount, and profit.
2. `sales_2019.csv` (3,312 records) – Order lines from 2019 with identical structure.
3. `customer_details.csv` (5,008 records) – Master record matching order IDs to customer names, cities, states, and regions.

---

## Tools Used
- **Database Engine:** SQLite
- **Interface:** DB Browser for SQLite
- **Repository Management:** GitHub

---

## Key Findings
- **Overall Performance:** Total recorded sales reached **$1,342,428** with a total profit of **$175,213** across **3,001 unique orders** (overall margin: **13.1%**).
- **Category Profit Margins:** **Furniture** earns a low **2.4% margin**, compared with **18.2%** for **IT Products** and **17.4%** for **Stationary & Supplies**.
- **Loss-Making Sub-Categories:** **Tables** (-$11.1K), **Supplies** (-$1.7K), and **Bookcases** (-$372) are net loss-making sub-categories.
- **Regional Disparities:** The **West** region generated the highest sales ($437.7K) and profit margin (**15.5%**), while the **Central** region had the weakest margin (**9.3%**).
- **Unprofitable States:** Top loss-making states are led by **Texas** (-$17.5K total loss across 140 loss orders), **Pennsylvania** (-$12.5K), **Illinois** (-$12.0K), **Ohio** (-$11.5K), and **North Carolina** (-$6.7K).
- **Year-over-Year Growth:** Total sales expanded **20.4%** from 2018 ($609.1K) to 2019 ($733.3K).

---

## Suggestions from the Data
- **Review Pricing & Costs:** Re-evaluate supplier costs and pricing models for **Tables**, **Supplies**, and **Bookcases** to recover margins.
- **Regional Focus:** Investigate operational bottlenecks and discounting practices in the **Central** region and high-loss states (**Texas**, **Pennsylvania**, **Illinois**, **Ohio**).
- **Expand High-Margin Categories:** Shift marketing focus toward growing **IT Products** and **Stationery & Supplies**.

---

## Data Validation & Checks
- **Combined Sales:** `UNION ALL` successfully merged 2018 and 2019 sheets to yield 5,898 total order line items.
- **Customer Matching:** Verified 100% referential integrity with **0 unlinked sales lines**.
- **Uniqueness:** Confirmed zero duplicate `order_id` values within the customer details master table.

---

## SQL Techniques Used
- **Data Hygiene:** Table creation, casting (`CAST`), clean alias creation, `UNION ALL`.
- **Aggregation & Pivoting:** `SUM`, `COUNT`, `ROUND`, and conditional aggregation via `CASE WHEN`.
- **Joins & CTEs:** `INNER JOIN`, `LEFT JOIN`, anti-joins, and common table expressions (`WITH` clauses).
- **Advanced Analytics:** Window functions (`LAG` for YoY month-over-month growth, `RANK() OVER (PARTITION BY ...)` for customer ranking).

---

## Repository Structure
```text
sql-orders-customers-join-analysis/
├── data/
│   ├── sales_2018.csv
│   ├── sales_2019.csv
│   └── customer_detail.csv
├── sql/
│   ├── 01_setup_and_checks.sql
│   └── 02_join_analysis.sql
├── screenshot/
│   ├── Q3.png
│   ├── Q5.png
│   └── Q8.png
└── README.md
