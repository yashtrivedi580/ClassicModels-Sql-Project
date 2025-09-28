# ClassicModels-Sql-Project
Hands-on SQL project using the ClassicModels dataset to explore real-world business problems. Includes queries for payments, orders, products, employees, and inventory analysis.
# ClassicModels SQL Project

This project explores the **ClassicModels** sample database using SQL queries to perform business analysis, generate insights, and answer real-world business questions.

The dataset contains information about **customers, employees, offices, orders, order details, products, product lines, and payments**, making it suitable for practicing SQL queries related to **data analysis, reporting, and business intelligence**.

---

## 📂 Dataset Overview

* **Customers** – Customer details, credit limits, assigned sales representatives
* **Employees** – Employee details, roles, and reporting hierarchy
* **Offices** – Office locations and contact details
* **Orders** – Order information (dates, status, customers)
* **OrderDetails** – Line items with quantity and price
* **Payments** – Customer transactions and payment history
* **Products** – Product catalog, vendors, stock, and prices
* **ProductLines** – Categories of products

---

## 🛠️ Key SQL Concepts Practiced

* **Filtering & Conditions** (`WHERE`, `LIKE`, `IN`)
* **Aggregation & Grouping** (`SUM`, `COUNT`, `AVG`, `GROUP BY`, `HAVING`)
* **Sorting & Limiting** (`ORDER BY`, `LIMIT`, `OFFSET`)
* **Joins** (`INNER JOIN`, `LEFT JOIN`, `SELF JOIN`)
* **Subqueries & Nested Queries**
* **String & Date Functions** (`UCASE`, `LCASE`, `DATE_FORMAT`, etc.)
* **Data Updates & Deletes** (`UPDATE`, `DELETE`)

---

## 📊 Business Questions Answered

* Customers in the USA with a credit limit above $1000
* Sales representatives for customers in Spain, France, and Italy
* Most expensive products by category (e.g., Planes, Motorcycles)
* Products with low stock and high inventory
* Top customers by payments and revenue in 2004
* Monthly and yearly payment trends
* High-value orders (>$25,000) and orders on hold
* Profit margin analysis of products
* Employee–Manager reporting relationships

---

## 🚀 Insights Gained

* **Customer Segmentation** → Identifying high-value customers by region and credit limit
* **Sales & Employee Tracking** → Monitoring sales reps and office staffing
* **Inventory Management** → Detecting low-stock and high-stock products
* **Financial Performance** → Payment trends, top customers, and large transactions
* **Profitability Analysis** → Products with the highest margins for targeted promotions
* **Operational Risks** → Detecting "On Hold" orders that may impact revenue

---

## 📁 File Structure

```
classicmodels.sql   # SQL script with queries and exercises
README.md           # Project documentation
```

---

## 💡 How to Use

1. Import the `classicmodels` database into MySQL.
2. Run queries from `classicmodels.sql` in a SQL client or IDE (e.g., MySQL Workbench, VS Code with SQL extension).
3. Modify queries to explore additional insights.

---

## 📌 Future Enhancements

* Build interactive dashboards (Power BI / Tableau) using the ClassicModels dataset
* Automate reporting with stored procedures
* Explore advanced SQL concepts (CTEs, Window Functions)

---

