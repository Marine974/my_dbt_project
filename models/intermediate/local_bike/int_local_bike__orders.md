{% docs int_local_bike__orders %}

This model provides a view of orders with addition of shipping status for each order:

- **Shipping status**: Is calculated from the difference between required date and shipping date. 
    - If the difference is positive then shipping is on time
    - If the difference is negative, shipping has been delayed
    - Else it is not shipped yet

{% enddocs %}