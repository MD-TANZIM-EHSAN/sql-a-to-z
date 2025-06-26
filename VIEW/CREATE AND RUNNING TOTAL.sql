CREATE view saledb.V_monthly_summary as(

select 
       DATE_FORMAT(OrderDate, '%Y-%m-01') ORDER_PER_MONTH, -- convert the all date day into 1
       SUM(Sales) TOTAL_SALE,
       count(OrderID) TOTAL_ORDER,
       Sum(Quantity) TOTAL_QUANTITY
from orders
group by ORDER_PER_MONTH
)
 -- -------------------------------------------
 SELECT ORDER_PER_MONTH,TOTAL_SALE,
 sum(TOTAL_SALE) over(order by ORDER_PER_MONTH) Running_Total
 FROM saledb.v_monthly_summary;