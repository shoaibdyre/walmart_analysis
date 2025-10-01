Use walmart_analysis;

select * from walmart

-- Walmart Business Problems

-- 1. Analyze Payment Methods and Sales
   /* Question: What are the different payment methods, and how many transactions and quantity were 
   sold with each method?
   */

    select 
	     payment_method,
	     count(*) as total_transection,
	     sum(quantity) as total_quantity
    from walmart 
    group by payment_method 
    order by total_transection desc ,total_quantity desc;

-- 2. Identify the Highest-Rated Category in Each Branch
   /* Question: Which category received the highest average rating in each branch? */

    select * 
    from
		    (select 
			    branch,
			    category,
			    avg(rating) as avg_rating,
			    rank() over(partition by branch order by avg(rating) desc) as rank
		    from walmart
		    group by branch, category
		    )t
    where rank = 1;

-- 3. Determine the Busiest Day for Each Branch
   /* Question: What is the busiest day of the week for each branch based on transaction
   volume?
   */

    SELECT branch, day_name, no_transactions
    FROM (
        SELECT 
            branch,
            DATENAME(dw, CAST(date AS DATE)) AS day_name,
            COUNT(*) AS no_transactions,
            RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS rank
        FROM walmart
        GROUP BY branch, DATENAME(dw, CAST(date AS DATE))
    ) AS ranked
    WHERE rank = 1;

-- 4. Calculate Total Quantity Sold by Payment Method
  /* Question: How many items were sold through each payment method?
   */

    SELECT 
        payment_method,
        SUM(quantity) AS no_qty_sold
    FROM walmart
    GROUP BY payment_method;

-- 5. Analyze Category Ratings by City
  /* Question: What are the average, minimum, and maximum ratings for each category in
   each city?
   */
   select category,
			min(rating) as minimum_rating,
			max(rating) as maximum_rating,
			round(avg(rating),2) as avrage_rating
   from walmart
   group by category

-- 6. Calculate Total Profit by Category
   /* Question: What is the total profit for each category, order from highest to lowest?
   */
  SELECT 
	category,
    round(SUM(quantity * unit_price * (profit_margin/100)),2) AS total_profit
	FROM walmart
	group by category
	order by total_profit desc

-- 7. Determine the Most Common Payment Method per Branch
   /* Question: What is the most frequently used payment method in each branch?
   */
   WITH cte AS (
    SELECT 
        branch,
        payment_method,
        COUNT(*) AS total_trans,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS rank
    FROM walmart
    GROUP BY branch, payment_method
     )
	SELECT branch, payment_method AS preferred_payment_method
	FROM cte
	WHERE rank = 1;

-- 8. Analyze Sales Shifts Throughout the Day
   /* Question: How many transactions occur in each shift (Morning, Afternoon, Evening)
   */
SELECT
    branch, 
    CASE
        WHEN time BETWEEN '00:00:00' AND '05:00:00' THEN 'Night'
        WHEN time BETWEEN '05:00:01' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS shifts,
    COUNT(*) AS num_invoices
FROM walmart
GROUP BY branch, 
    CASE
        WHEN time BETWEEN '00:00:00' AND '05:00:00' THEN 'Night'
        WHEN time BETWEEN '05:00:01' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY branch, num_invoices DESC;

-- 9. Identify Branches with Highest Revenue Decline Year-Over-Year
   /* Question: Which branches experienced the largest decrease in revenue compared to
   the previous year?
   */

   WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total_amount) AS revenue
    FROM walmart
    WHERE YEAR(CONVERT(DATE, date, 103)) = 2022
    GROUP BY branch
    ),
    revenue_2023 AS (
        SELECT 
            branch,
            SUM(total_amount) AS revenue
        FROM walmart
        WHERE YEAR(CONVERT(DATE, date, 103)) = 2023
        GROUP BY branch
    )
    SELECT TOP 5
        r2022.branch,
        r2022.revenue AS last_year_revenue,
        r2023.revenue AS current_year_revenue,
        ROUND(((r2022.revenue - r2023.revenue) / NULLIF(r2022.revenue, 0)) * 100, 2) AS revenue_decrease_ratio
    FROM revenue_2022 AS r2022
    JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
    WHERE r2022.revenue > r2023.revenue
    ORDER BY revenue_decrease_ratio DESC;