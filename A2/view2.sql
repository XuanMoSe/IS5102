CREATE VIEW Book_Quantity AS
SELECT quantity_in_stock, title, author, publisher, price, type, book_edition
FROM Book NATURAL JOIN Edition
WHERE Book.book_id = Edition.book_id
AND quantity_in_stock <= 100;