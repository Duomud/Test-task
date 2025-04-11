Реализовать операции:

- Поступление новой книги:

1)Добавляем книгу:

INSERT INTO test.book (id, title, author, year, isbn, publisher) 
VALUES (26, 'Пример', 'Пример', 2025, '1234567890123', 'Пример');


2)Указываем полку для новой книги:

INSERT INTO test.book_on_shelves (id, book_id, shelves_id) 
VALUES (100, 26, 3);


3)Добавляем статус книги:

INSERT INTO test.book_status (id, book_id, taken_at, returned_at, reader_id)
VALUES (100, 26, NULL, NULL, NULL);


- Выдача книги читателю:

1)Обновляем статус книги в таблице book_status
UPDATE test.book_status
SET taken_at = CURRENT_DATE,
reader_id = 3,
returned_at = NULL
WHERE book_id = 26 AND returned_at IS NULL;


2)Убираем книгу с полки:

DELETE FROM test.book_on_shelves
WHERE book_id = 26;


- Возврат книги читателем в библиотеку

1)UPDATE test.book_status:

SET returned_at = CURRENT_DATE,
reader_id = NULL
WHERE book_id = 26 AND reader_id = 3 AND returned_at IS NULL;    


2)Возвращаем книгу на полку в таблице book_on_shelves:

INSERT INTO test.book_on_shelves (id, book_id, shelves_id)
VALUES (100, 26, 3);

- Списание книг по определённым критериям (дата печати старше заданного порога):


1)Выбираем книги, которые нужно списать
SELECT id, title, author, year
FROM test.book
WHERE year < 2000;


2)Помечаем книги как списанные:

UPDATE test.book
SET status = 'списана'
WHERE year < 2000;


3)Удаляем книги из таблицы book_on_shelves:

DELETE FROM test.book_on_shelves
WHERE book_id IN (SELECT id FROM book WHERE year < 2000);




- Книги, находящиеся на руках у читателей дольше заданного порога:

SELECT book.id, book.title, reader.full_name, book_from_reader.added
FROM test.book_from_reader
JOIN test.book ON book_from_reader.book_id = book.id
JOIN test.reader ON book_from_reader.reader_id = reader.id
WHERE book_from_reader.written IS NULL AND CURRENT_DATE - book_from_reader.added > 30; 


- Топ-10 последовательностей из 2-х книг, последовательно взятых одним и тем же читателем:
SELECT book.id, book.title, COUNT(book_from_reader.book_id) AS total_issued
FROM test.book_from_reader
JOIN test.book ON book_from_reader.book_id = book.id
WHERE book_from_reader.added BETWEEN CURRENT_DATE - INTERVAL '30 days' AND CURRENT_DATE
GROUP BY book.id, book.title
ORDER BY total_issued DESC
LIMIT 10;


- Топ-10 читателей по количеству взятых книг за период:
SELECT reader.id, reader.full_name, COUNT(book_from_reader.book_id) AS total_books_issued
FROM test.book_from_reader
JOIN test.reader ON book_from_reader.reader_id = reader.id
WHERE book_from_reader.added >= CURRENT_DATE - INTERVAL '30 days' AND book_from_reader.added <= CURRENT_DATE
GROUP BY reader.id, reader.full_name
ORDER BY total_books_issued DESC
LIMIT 10;


- Топ-10 читателей по количеству посещений библиотеки:
SELECT reader.id, reader.full_name, COUNT(*) AS visit
FROM test.book_from_reader 
JOIN test.reader ON book_from_reader.reader_id = reader.id
GROUP BY reader.id, reader.full_name
ORDER BY visit DESC
LIMIT 10;

