-- Group by
-- Find the total score for each country 
select  Country,sum(Score) as Total_score from customers
group by Country;
-- Find the total score amd total number of customers for each country
select Country,sum(Score) AS Total_scores,count(FirstName) AS Total_customers from customers
group by Country