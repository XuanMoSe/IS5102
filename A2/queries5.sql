SELECT Book.book_id, title, author, rating
FROM Book, Reviews
WHERE Book.book_id = Reviews.book_id
AND rating >=6;