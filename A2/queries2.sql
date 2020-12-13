SELECT Order_. order_id, delivery_city, date_ordered
FROM Order_
WHERE Order_.delivery_city = 'Edinburgh'
AND Order_.date_ordered >= 20160000
ORDER BY date_ordered DESC;