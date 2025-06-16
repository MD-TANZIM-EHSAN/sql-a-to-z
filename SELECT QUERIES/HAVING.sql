-- HAVING
/* Find the average score for each country considering only customers with a score not equal to 0 and return only 
those countries with an average score greater than 430*/
select Country,avg(Score) AS AVERAGE from customers
where Score != 0
group by Country
having avg(Score)>430