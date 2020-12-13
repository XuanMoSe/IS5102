CREATE VIEW Science_and_Technology_Book AS
SELECT genre, title, author, publisher, price
FROM Book NATURAL JOIN Edition NATURAL JOIN Book_genre
WHERE Book.book_id = Edition.book_id
AND genre = 'Science and Technology';