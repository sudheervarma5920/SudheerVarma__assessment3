create table Subject
(
subjectId int Primary key,
subTitle varchar(30) not null,
)

create table Book
(
BookID int primary key,
Title varchar(30) not null,
Price int not null,
Volume int not null,
author varchar(30) not null,
PublishDate Date not null,
subjectId int,
constraint fk_Subject foreign key(subjectId) references Subject(subjectId)
)

INSERT INTO Subject (subjectId, subtitle) VALUES
(1, 'maths'),
(2, 'hindi'),
(3, 'English'),
(4, 'Social'),
(5, 'Science');

INSERT INTO Book (bookId, title, price, volume, author, publishDate, subjectId) VALUES
(1, 'book1', 400, 1, 'author1', '2021-03-17', 1),
(2, 'book2', 450, 2, 'author2', '2022-01-10', 2),
(3, 'book3', 350, 1, 'author3', '2023-03-05', 3),
(4, 'book4', 550, 1, 'author4', '2022-05-12', 3),
(5, 'book5', 600, 1, 'author5', '2021-05-10', 4),
(6, 'book6', 750, 1, 'author6', '2021-06-18', 3),
(7, 'book7', 350, 1, 'author7', '2020-07-25', 4),
(8, 'book8', 600, 2, 'author8', '2020-08-30', 4),
(9, 'book9', 560, 1, 'author9', '2022-09-15', 5),
(10, 'book10', 450, 1, 'author10', '2022-10-05', 5),
(11, 'book11', 550, 2, 'author11', '2022-11-15', 1),
(12, 'book12', 300, 1, 'author12', '2023-01-10', 2),
(13, 'book13', 400, 1, 'author13', '2021-02-20', 3),
(14, 'book14', 450, 2, 'author14', '2020-04-05', 4),
(15, 'book15', 850, 1, 'author15', '2022-11-25', 5);


select Book.title, Book.price, Book.volume, Book.author, Book.publishDate, Subject.subtitle
from Book
inner join Subject ON Book.subjectId = Subject.subjectId;

select * from Book
where publishDate between '2021-02-01' and '2023-11-23';

select author, COUNT(*) AS total from Book group by author;

select Subject.subtitle, COUNT(Book.bookId) as numberOfBooks FROM Book inner join subject on Book.subjectId = Subject.subjectId
group by subject.subtitle;


select count(*) as numberofBooks from book where year(PublishDate)<2000

update  Book set price= 650, volume=2 where BookID=2

update book set price = price*1.1 where subjectId=(select subjectId from Subject where subTitle='English')

delete book where BookID=15

select * from Book where price > 650 and subjectId = (select subjectId from Subject WHERE subtitle = 'maths');

select Book.title, Book.price, Book.volume, Book.author, Book.publishDate, Subject.subtitle FROM Book INNER JOIN Subject on Book.subjectId = Subject.subjectId
order by Subject.subtitle ASC;

select min(price) as minPrice from Book

select count(*) as countOfmaths from book where subjectId=(select subjectId from Subject where subtitle='maths')