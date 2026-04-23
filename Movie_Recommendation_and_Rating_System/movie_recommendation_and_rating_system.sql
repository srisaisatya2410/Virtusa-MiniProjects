create database movies_system;
use movies_system;

-- Users TABLE
create table Users(
    user_id int primary key,
    name varchar(100),
    age int
);
insert into Users values
(1, 'Satya', 21),
(2, 'Anitha', 28),
(3, 'Asreetha', 20),
(4, 'Mahitha', 24),
(5, 'Hari', 30),
(6, 'Sri', 45),
(7, 'Sudha', 50),
(8, 'Madhu', 19),
(9, 'Swetha', 25),
(10, 'Hasini', 24);
select * from Users;


-- Movies TABLE
create table Movies (
    movie_id int primary key,
    title varchar(50),
    genre varchar(50)
);
insert into Movies values
(101, 'Salaar', 'Action'),
(102, 'Athadu', 'Action'),
(103, 'Maharshi', 'Drama'),
(104, '3 Idiots', 'Drama'),
(105, 'RRR', 'Action-Drama'),
(106, 'Yeh Jawaani Hai Deewani', 'Romance'),
(107, 'PK', 'Comedy-Drama'),
(108, 'Khushi', 'Romance'),
(109, 'Khaidi', 'Action'),
(110, 'Darling', 'Romance');
select * from Movies;

-- Ratings TABLE
create table Ratings (
    user_id int,
    movie_id int,
    rating int,
    primary key (user_id, movie_id),
    foreign key (user_id) references Users(user_id),
    foreign key (movie_id) references Movies(movie_id)
);
insert into Ratings values
(1, 101, 5),
(1, 104, 4),
(2, 102, 4),
(2, 105, 5),
(3, 103, 3),
(3, 107, 4),
(4, 101, 5),
(4, 109, 4),
(5, 106, 3),
(5, 108, 4),
(6, 105, 5),
(6, 110, 3),
(7, 104, 5),
(7, 107, 4),
(8, 102, 3),
(8, 109, 4),
(9, 101, 4),
(9, 108, 5),
(10, 103, 4),
(10, 110, 5);
select * from Ratings;

-- Watch History TABLE
create table Watch_History (
    user_id int,
    movie_id int,
    watch_date date,
    foreign key (user_id) references Users(user_id),
    foreign key (movie_id) references Movies(movie_id)
);
insert into Watch_History values
(1, 101, '2026-01-01'),
(1, 104, '2026-01-02'),
(2, 102, '2026-01-03'),
(2, 105, '2026-01-04'),
(3, 103, '2026-01-05'),
(3, 107, '2026-01-06'),
(4, 101, '2026-01-07'),
(4, 109, '2026-01-08'),
(5, 106, '2026-01-09'),
(5, 108, '2026-01-10'),
(6, 105, '2026-01-11'),
(6, 110, '2026-01-12'),
(7, 104, '2026-01-13'),
(7, 107, '2026-01-14'),
(8, 102, '2026-01-15'),
(8, 109, '2026-01-16'),
(9, 101, '2026-01-17'),
(9, 108, '2026-01-18'),
(10, 103, '2026-01-19'),
(10, 110, '2026-01-20');
select * from Watch_History

-- Top Rated Movies
select m.title, ROUND(AVG(r.rating), 1) as Avg_Rating
from Movies m join Ratings r on m.movie_id = r.movie_id
group by m.Title having Avg_Rating >=4
order by Avg_Rating desc;


-- Most Popular Genres
select genre, count(*) AS Total_Watches
from Movies m join Watch_History w
ON m.movie_id = w.movie_id
group by genre;

-- Movie Recommendation
select distinct m.title, r.rating
from Movies m join Ratings r on m.movie_id = r.movie_id
where r.rating = 5;


-- User Behaviour Analysis
select u.name, count(w.movie_id) AS Total_Watched
from Users u join Watch_History w on u.user_id = w.user_id
group by u.name order by Total_Watched desc;

-- Trending Movies
select m.title, count(*) AS Watch_Count
from Movies m join Watch_History w on m.movie_id = w.movie_id
group by m.title order by Watch_Count desc;





