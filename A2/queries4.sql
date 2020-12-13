SELECT Book. book_id, title, author, book_edition
FROM Book, Edition
WHERE Book.book_id = Edition.book_id
AND book_edition > 5;