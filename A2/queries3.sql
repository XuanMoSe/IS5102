SELECT book_id, title, book_edition, quantity_in_stock, name, account_no, min(supply_price)
FROM Book NATURAL JOIN Edition NATURAL JOIN Supplier NATURAL JOIN Supplies
WHERE quantity_in_stock < 5
GROUP BY book_edition;