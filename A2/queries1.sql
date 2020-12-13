SELECT Book. book_id, title, author, publisher, genre
FROM Book, Book_genre
WHERE Book.book_id = Book_genre.book_id
AND publisher = 'Ultimate Books'
AND genre = 'Science and Technology';