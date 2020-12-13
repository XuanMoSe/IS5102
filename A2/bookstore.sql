PRAGMA foregin_keys = true;

CREATE TABLE Customer (
customer_id CHAR(8)PRIMARY KEY,
name VARCHAR(20)NOT NULL,
email VARCHAR(30)NOT NULL,
street VARCHAR(20)NOT NULL,
city VARCHAR(20)NOT NULL,
postcode VARCHAR(10)NOT NULL,
country VARCHAR(10)NOT NULL);

CREATE TABLE Customer_phone (
customer_id CHAR(8),
customer_phone_type VARCHAR(20)NOT NULL,
customer_phone_number CHAR (13),
PRIMARY KEY(customer_id, customer_phone_number),
FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_ (
order_id CHAR(10)PRIMARY KEY,
delivery_street VARCHAR(20)NOT NULL,
delivery_city VARCHAR(20)NOT NULL,
delivery_postcode VARCHAR(10)NOT NULL,
delivery_country VARCHAR(10)NOT NULL,
date_ordered date,
date_delivered date);

CREATE TABLE Order_Places (
order_id CHAR(10),
customer_id CHAR(8),
PRIMARY KEY(order_id, customer_id),
FOREIGN KEY(order_id) REFERENCES Order_(order_id),
FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Book (
book_id CHAR(5)PRIMARY KEY,
title VARCHAR(30)NOT NULL,
author VARCHAR(30)NOT NULL,
publisher VARCHAR(30)NOT NULL
);

CREATE TABLE Book_genre (
book_id CHAR(5)PRIMARY KEY,
genre VARCHAR(20)NOT NULL,
FOREIGN KEY(book_id) REFERENCES Book(book_id)
);

CREATE TABLE Reviews (
book_id CHAR(5),
customer_id CHAR(8),
rating CHAR(1),
PRIMARY KEY(book_id, customer_id),
FOREIGN KEY(book_id) REFERENCES Book(book_id),
FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Edition (
book_id CHAR(5),
book_edition VARCHAR(5),
type VARCHAR(15)NOT NULL,
price NUMERIC(5,2)NOT NULL,
quantity_in_stock VARCHAR(5)NOT NULL,
PRIMARY KEY(book_id, book_edition, type),
FOREIGN KEY(book_id) REFERENCES Book(book_id)
);

CREATE TABLE Contains_ (
book_id CHAR(5),
order_id CHAR(10),
book_edition VARCHAR(5)NOT NULL,
type VARCHAR(15)NOT NULL,
PRIMARY KEY(order_id, book_id, book_edition, type),
FOREIGN KEY(order_id) REFERENCES Order_(order_id),
FOREIGN KEY(book_id) REFERENCES Book(book_id)
);

CREATE TABLE Supplier (
supplier_id CHAR(5)PRIMARY KEY,
name VARCHAR(30)NOT NULL,
account_no CHAR(10)NOT NULL
);

CREATE TABLE Supplier_phone (
supplier_id CHAR(5),
supplier_phone_number CHAR(13),
PRIMARY KEY(supplier_id, supplier_phone_number),
FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id)
);

CREATE TABLE Supplies (
supplier_id CHAR(5),
book_id CHAR(5),
supply_price NUMERIC(5,2)NOT NULL,
PRIMARY KEY(supplier_id, book_id),
FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id),
FOREIGN KEY(book_id) REFERENCES Book(book_id)
);

-------------------------------------------------------------------
-- Insert data
-------------------------------------------------------------------
/* All information is fake. Just for testing. */
INSERT INTO Customer VALUES
('00000001', 'Robert', 'robert@mail.com', '11 random street', 'Edinburgh', 'KY16 9XW', 'UK'),
('00000002', 'Jack', 'jack@mail.com', '22 king street', 'Edinburgh', 'EB16 9XW', 'UK'),
('00000003', 'Bob', 'bob@mail.com', '33 happy street', 'London', 'LD1A 1EE', 'UK'),
('00000004', 'Quentin', 'quentin@mail.com', '44 west street', 'Cardiff', 'CD23 2DF', 'UK'),
('00000005', 'Leon', 'Leon@mail.com', '55 east street', 'Glasgow', 'GG23 DRE', 'UK'),
('00000006', 'Peter', 'peter@mail.com', '66 spider street', 'Manchester', 'MC66 89W', 'UK'),
('00000007', 'Tony', 'tony@mail.com', '77 iron street', 'Dundee', 'DD78 9XW', 'UK'),
('00000008', 'Anna', 'anna@mail.com', '88 peace street', 'Southampton', 'SA89 8TR', 'UK'),
('00000009', 'Ci', 'ci@mail.com', '99 universe street', 'Liverpool', 'LP09 78W', 'UK'),
('00000010', 'Joe', 'joe@mail.com', '10 final street', 'Bristol', 'BT10 99X', 'UK');

INSERT INTO Customer_phone VALUES
('00000001', 'mobile phone', '078 1111 6785'),
('00000002', 'telephone', '078 2222 6785'),
('00000003', 'telephone', '078 3333 6785'),
('00000004', 'mobile phone', '078 4444 6785'),
('00000005', 'telephone', '078 5555 6785'),
('00000006', 'telephone', '078 6666 6785'),
('00000007', 'mobile phone', '078 7777 6785'),
('00000008', 'telephone', '078 8888 6785'),
('00000009', 'telephone', '078 9999 6785'),
('00000010', 'mobile phone', '078 1010 6785');

INSERT INTO Order_ VALUES
('1234567891', '111 start street', 'Edinburgh', 'ED1', 'UK', 20130101, 20130102),
('1234567892', '222 crown street', 'Edinburgh', 'ED2', 'UK', 20140202, 20140203),
('1234567893', '333 park street', 'Manchester', 'MC3', 'UK', 20150303, 20150304),
('1234567894', '444 Roman street', 'Bristol', 'BT4', 'UK', 20160404, 20160405),
('1234567895', '555 King road', 'Southampton', 'SA5', 'UK', 20170505, 20170506),
('1234567896', '666 west road', 'Dundee', 'DD6', 'UK', 20180606, 20180607),
('1234567897', '777 east road', 'Glasgow', 'GG7', 'UK', 20190707, 20190708),
('1234567898', '888 north road', 'Edinburgh', 'ED8', 'UK', 20100808, 20100809),
('1234567899', '999 south road', 'London', 'LD9', 'UK', 20110909, 20110910),
('1234567810', '100 final road', 'Edinburgh', 'ED10', 'UK', 20201010, 20201011),
('1234567811', '101 another final road', 'Edinburgh', 'ED11', 'UK', 20201111, 20201112);

INSERT INTO Order_Places VALUES
('1234567891', '00000002'),
('1234567892', '00000004'),
('1234567893', '00000006'),
('1234567894', '00000008'),
('1234567895', '00000010'),
('1234567896', '00000009'),
('1234567897', '00000007'),
('1234567898', '00000005'),
('1234567899', '00000003'),
('1234567810', '00000001');

INSERT INTO Book VALUES
('00001', 'Harry Potter', 'J K Rowling', 'Ultimate Books'),
('00002', 'Les Enfants du capitaine Grant', 'Jules Gabriel Verne', 'Ultimate Books'),
('00003', 'The Hunger Games', 'Suzanne Collins ', 'Tom media'),
('00004', 'Brave New World', 'Aldous Huxley', 'Recorded Books'),
('00005', 'Angels & Demons', 'Dan Brown', 'HighBridge Audio'),
('00006', 'The Lord of the Rings', 'J. R. R. Tolkien', 'HighBridge Audio'),
('00007', 'The Da Vinci Code', 'Dan Brown', 'Solis Press'),
('00008', 'I, Robot', 'Isaac Asimov', 'Ultimate Books'),
('00009', 'This is life', 'Elliot K Kirby', 'RealLifeBooks'),
('00010', 'The Foundation Series', 'Isaac Asimov', 'Ultimate Books');

INSERT INTO Book_genre VALUES
('00001', 'fiction'),
('00002', 'Science and Technology'),
('00003', 'adventure'),
('00004', 'classic'),
('00005', 'adventure'),
('00006', 'fiction'),
('00007', 'adventure'),
('00008', 'Science and Technology'),
('00009', 'classic'),
('00010', 'Science and Technology');

INSERT INTO Reviews VALUES
('00001', '00000001', '9'),
('00002', '00000002', '8'),
('00003', '00000003', '7'),
('00004', '00000004', '6'),
('00005', '00000005', '5'),
('00006', '00000006', '4'),
('00007', '00000007', '4'),
('00008', '00000008', '3'),
('00009', '00000009', '1'),
('00010', '00000010', '1');

INSERT INTO Edition VALUES
('00001', '8', 'audiobook', '010.10', '100'),
('00001', '4', 'hardcover', '010.10', '1'),
('00001', '5', 'paperback', '010.10', '2'),
('00001', '6', 'audiobook', '010.10', '3'),
('00002', '7', 'hardcover', '020.20', '200'),
('00003', '6', 'audiobook', '030.30', '300'),
('00004', '5', 'hardcover', '040.40', '400'),
('00005', '4', 'paperback', '050.50', '500'),
('00006', '3', 'audiobook', '060.60', '600'),
('00007', '2', 'paperback', '070.70', '700'),
('00007', '3', 'paperback', '070.70', '4'),
('00007', '4', 'audiobook', '070.70', '3'),
('00007', '6', 'hardcover', '070.70', '2'),
('00008', '1', 'paperback', '080.80', '800'),
('00009', '9', 'audiobook', '090.90', '900'),
('00010', '5', 'hardcover', '100.10', '1000');

INSERT INTO Contains_ VALUES
('00001', '1234567891', '8', 'audiobook'),
('00002', '1234567892', '7', 'hardcover'),
('00003', '1234567893', '6', 'audiobook'),
('00004', '1234567894', '5', 'hardcover'),
('00005', '1234567895', '4', 'paperback'),
('00006', '1234567896', '3', 'audiobook'),
('00007', '1234567897', '2', 'paperback'),
('00008', '1234567898', '1', 'paperback'),
('00009', '1234567899', '9', 'audiobook'),
('00010', '1234567810', '5', 'hardcover');

INSERT INTO Supplier VALUES
('11111', 'The Worker', '1111100000'),
('22222', 'The Student', '2222200000'),
('33333', 'The Book', '3333300000'),
('44444', 'The Teacher', '4444400000'),
('55555', 'The Learner', '5555500000'),
('66666', 'The Listener', '6666600000'),
('77777', 'The Supplier', '7777700000'),
('88888', 'The One', '8888800000'),
('99999', 'The What?', '9999900000'),
('10101', 'The NeXt', '1010100000');

INSERT INTO Supplier_phone VALUES
('11111', '088 0631 1111'),
('22222', '088 0631 2222'),
('33333', '088 0631 3333'),
('44444', '088 0631 4444'),
('55555', '088 0631 5555'),
('66666', '088 0631 6666'),
('77777', '088 0631 7777'),
('88888', '088 0631 8888'),
('99999', '088 0631 9999'),
('10101', '088 0631 1010');

INSERT INTO Supplies VALUES
('11111', '00001', '001.10'),
('22222', '00002', '002.20'),
('33333', '00003', '003.30'),
('44444', '00004', '004.40'),
('55555', '00005', '005.50'),
('66666', '00006', '006.60'),
('77777', '00007', '007.70'),
('88888', '00008', '008.80'),
('99999', '00009', '009.90'),
('10101', '00010', '010.10');
