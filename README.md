# Retail-sale📊

## **Project Overview**
This project performs **retail sales analysis** using MySQL. It helps in understanding **customer behavior, spending habits, product trends, and seasonal sales variations**. The database **`vanshu_sales`** stores transaction data, and SQL queries are used to extract meaningful business insights.

---

## **Database Structure**
The project contains a single table **`retail_sale`**, which holds transactional data.

### **Table: `retail_sale`**
| Column Name       | Data Type      | Description |
|------------------|--------------|-------------|
| `Transaction_ID`  | `BIGINT NOT NULL PRIMARY KEY` | Unique transaction identifier |
| `Dates`          | `DATE`        | Date of the transaction |
| `Customer_ID`    | `VARCHAR(10)` | Unique customer identifier |
| `Gender`         | `VARCHAR(10)` | Customer's gender (Male/Female) |
| `Age`            | `INT`         | Customer's age |
| `Product_Category` | `VARCHAR(10)` | Product category purchased |
| `Quantity`       | `INT`         | Number of items bought |
| `Price_per_Unit` | `INT`         | Price per unit of the product |
| `Total_Amount`   | `INT`         | Total transaction amount (`Quantity * Price_per_Unit`) |

---

## **Key SQL Queries & Insights**
### **1️⃣ Data Validation**
- ✅ **Check for NULL values** to ensure data completeness.
- ✅ **Count total transactions** recorded in the dataset.

### **2️⃣ Revenue & Customer Insights**
- 💰 **Total revenue generated** from all sales.
- 📊 **Average transaction amount** spent per purchase.
- 🏷️ **Unique customers count** to measure customer base.
- 🏆 **Top spending customers** by total purchases and total amount spent.

### **3️⃣ Sales Trends & Seasonal Analysis**
- 📅 **Daily, Weekly, Monthly, and Yearly sales trends** to identify patterns.
- 🔥 **Highest sales revenue date** to find peak transaction days.
- 📈 **Sales trends by season** (Winter, Spring, Monsoon, Autumn).
- 🕒 **Peak sales hours or days of the week** to determine when customers buy most.

### **4️⃣ Customer Spending Habits**
- 💸 **Spending habits by gender** (average spending per purchase).
- 🎂 **Average age of purchasing customers** (overall & by gender).
- 🛍️ **Most frequently purchased product category**.

### **5️⃣ Product & Pricing Insights**
- 📦 **Average price per unit for different product categories**.
- 📊 **Highest average quantity per transaction by product category**.
- 🏷️ **Most frequently purchased product category**.

---

## **How to Use**
1. Clone this repository to your local machine:
   ```sh
   git clone https://github.com/your-username/vanshu-sales-analysis.git
