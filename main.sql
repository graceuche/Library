.open Library

.mode column
.header on

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS book_copies;
DROP TABLE IF EXISTS loans;

  
CREATE TABLE IF NOT EXISTS users(
  user_id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  dob DATE NOT NULL,
  email VARCHAR(254) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS books(
  book_id INTEGER NOT NULL PRIMARY KEY,
  title VARCHAR(256) NOT NULL,
  description TEXT NOT NULL,
  published INTEGER NOT NULL,
  cost REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS book_copies(
  copy_id INTEGER NOT NULL PRIMARY KEY,
  book_id INTEGER NOT NULL,
  damaged INTEGER(1) NOT NULL DEFAULT 0,
  available INTEGER(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (book_id) REFERENCES items (item_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS loans(
  loan_id INTEGER NOT NULL PRIMARY KEY,
  copy_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  start_date DATE DEFAULT (datetime('now','localtime')),
  end_date DATE DEFAULT (datetime('now','+14days','localtime')),
  returned INTEGER(1) NOT NULL DEFAULT 0,
  FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE,
  FOREIGN KEY (copy_id) REFERENCES copies (copy_id) ON DELETE CASCADE
);

INSERT INTO users 
(name, dob, email)
VALUES 
("Debare Developer", date('now','-20 year'),
"debare.developer@ada.ac.uk"),

("Dana Diligent", date('now','-23 year'), 
"dana.diligent@ada.ac.uk");



select * from users;

  INSERT INTO books
  (title, description, published, cost)
 values
  ('Harry Potter','a boy born in wizard',date('now','-25 year'),10.65),
  ('Cat in the Hat',"children's book",date('now','-50 year'),7.65);

  SELECT * from books;

 
  INSERT INTO book_copies
  (book_id, damaged, available)
  values
  (1,1,1),(1,1,0),(1,1,0),(1,1,0),(1,1,0),(1,1,1), (2,0,1);

  select books.title,count(book_copies.book_id)
  from books
  inner join book_copies
  on books.book_id=book_copies.book_id
  WHERE book_copies.available=1
  group by books.title;

  INSERT INTO loans
  (user_id,copy_id)
  values 
  (1,1),(1,7),(2,2);

  SELECT u.name, b.title
  FROM users AS u
  INNER join loans AS l 
  ON u.user_id = l.user_id
  INNER join book_copies AS bc 
  on l.copy_id = bc.copy_id
  INNER join books AS b 
  on b.book_id = bc.book_id;
  
  
-- The task: insert into books, book_copies and loans. Try using joins and group by to see how many copies of each book is there, who borrowed each book.