# Walmart Sales Data Analysis

## 📊 Project Overview
This project analyzes Walmart sales data to derive business insights using Python for data processing and SQL Server for advanced analytics.

## 🎯 Business Objectives
- Analyze payment methods and sales patterns
- Identify highest-rated product categories
- Determine busiest days and peak hours
- Calculate profitability by category
- Understand regional preferences

## 🛠️ Technologies Used
- **Python 3.13.7**
- **Pandas** - Data manipulation and analysis
- **SQL Server** - Database management and queries
- **Jupyter Notebook** - Interactive development
- **pyodbc** - Database connectivity

## 🛠️ Installation & Setup

### Prerequisites
- Python 3.13
- MS SQL Server 2022
- Kaggle API key

## Executive Summary
This project provides comprehensive analysis of Walmart sales data to support data-driven business decisions.

## Data Overview
- **Original Dataset**: 10,051 records, 11 columns
- **After Cleaning**: 9,969 records, 12 columns
- **Data Quality**: Handled 31 missing values and 51 duplicates

## Methodology

### Phase 1: Data Preparation (Python)
- Data loading and initial exploration
- Data cleaning (handling missing values, duplicates)
- Data transformation (unit_price conversion)

### Phase 2: Database Integration
- SQL Server database creation
- Data export to SQL tables
- Connection validation

### Phase 3: Business Intelligence (SQL)
- 9 key business questions answered
- Advanced SQL queries (CTEs, Window Functions, Joins)
- Performance optimization

## Technical Implementation

### Python Components
```python
# Key operations performed:
- pd.read_csv() with error handling
- df.drop_duplicates() and df.dropna()
- String manipulation for unit_price
- SQLAlchemy for database connection

# Advanced techniques used:
- Common Table Expressions (CTEs)
- Window Functions (RANK(), OVER())
- Date/Time functions
- Conditional aggregation 
```
# Summary metrics

total_transactions = 9969
total_revenue = "$1.2M+"
average_rating = 5.83
top_category = "Food and beverages"
most_popular_payment = "Credit Card"

📱 PAYMENT METHOD BREAKDOWN

• Credit Card:    42%  (Most popular)
• E-wallet:       38%  
• Cash:           20%  (Least popular)

💰 TRANSACTION VOLUME BY PAYMENT

• E-wallet:    3,881 transactions
• Credit Card: 4,256 transactions  
• Cash:        1,832 transactions

🏆 TOP CATEGORIES BY RATING:
1. Food and beverages:        ★★★★☆ (7.1/10)
2. Health and beauty:         ★★★★☆ (7.0/10)
3. Sports and travel:         ★★★☆☆ (6.9/10)
4. Electronic accessories:    ★★★☆☆ (5.9/10)

🌅 SALES BY TIME SHIFTS:
• Morning (5AM-12PM):    35% of sales
• Afternoon (12PM-5PM):  40% of sales (Peak)
• Evening (5PM-12AM):    20% of sales
• Night (12AM-5AM):      5% of sales

⭐ CUSTOMER SATISFACTION:
• Average Rating: 5.83/10
• 65% of ratings are 7 or higher
• Food and beverages receive highest satisfaction

# Actionable Business Recommendations
## Immediate Actions:
- Promote Credit Card payments - Already most popular, consider loyalty rewards
- Stock optimization - Increase Food and beverages inventory during weekends
- Staff scheduling - Peak hours (2PM-4PM) need maximum staff
- Food and beverages expansion - Highest rated and most profitable category
- Afternoon marketing - Target campaigns during peak sales hours (12PM-5PM)

# 🎯 Demo Conclusion
This analysis demonstrates that Walmart's sales are strongest in:
- Food and beverages (highest profit and ratings)
- Afternoon shifts (peak transaction hours)
- Credit Card payments (most preferred method)

# Recommendation Priority:

🟢 High: Food and beverages inventory

🟡 Medium: Implement weekend promotion strategies

🔵 Low: Optimize staff scheduling for peak hours

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## 🌟 About Me

Hi there! I'm **Shoaib Dyre**, an aspiring Data Analyst passionate about transforming raw data into meaningful insights. This GitHub repository showcases my journey in learning data analysis, including projects, SQL queries and analytic reposts.

  🔍 Curious about data – I love exploring datasets, finding patterns, and telling stories through numbers.

  📊 Skills in development: SQL, Python (Pandas, NumPy), Excel, Power BI and data cleaning.

  🎯 Goal: Land my first Data Analyst role and contribute to data-driven decision-making.
