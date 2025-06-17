SELECT 
    current.sale_date,
    current.revenue AS current_revenue,
    previous.revenue AS previous_revenue,
    current.revenue - previous.revenue AS delta
FROM daily_sale AS current
JOIN daily_sale AS  previous 
    ON current.id = previous.id + 1;

/*ON current.id = previous.id + 1

current.id	previous.id	Match?
2	1	✅ (1+1 = 2)
3	2	✅ (2+1 = 3)
4	3	✅ (3+1 = 4) */