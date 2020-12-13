SELECT Customer.name, email, title, author, date_ordered
FROM Customer NATURAL JOIN Book NATURAL JOIN Order_ NATURAL JOIN Contains_ NATURAL JOIN Order_Places
WHERE date_ordered <= 20160000;