/*Q1. Who is the senior most employee based on job title? */

select * from employee
order by levels desc
limit 1


/*Q2. Which countries have the most invoices? */

select * from invoice
select count(*) as C, billing_country
from invoice 
Group by billing_country
order by C desc

/*Q3. What are the top 3 values of total invoice?*/

select * from invoice
select Total
from invoice 
order by total desc limit 3

/*Q4. Which city has the best customers? We would like to throw a promotional Music
festival in the city we made the most money? Write a query that returns one city 
and billing country that has the highest sum of invoice totals.
Return both the city name and sum of all invoice totals?*/

select * from invoice

select billing_country, Sum(total) as Invoice_Total
from invoice
group by billing_country
order by Invoice_Total limit 1

select billing_city, Sum(total) as Invoice_Total
from invoice
group by billing_city
order by Invoice_Total limit 1

/*Q5. Who is the best customer? The customer who spent the most money will be
declared  the best customer.
Write a query that returns the person who spent the most money?*/

select * from customer
select * from invoice

select customer.customer_id,first_name, last_name, Sum(total)as Most_Spending
from customer
Join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by Most_Spending
limit 1

/*Q6. Write a query to return the email, first name, last name and Genre of all rock listners?*/


select * from customer
select * from invoice

select distinct email, first_name, last_name from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
select track_id from track
join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock'
) order by email;

/*Q7. Write a query that returns the artist name and total track count of the top 10 rock bands?*/

select * from artist
select * from album
select * from track

select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs from  track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name = 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10

/*Q8. Return all the track names that have a song length longer than the average song length. Return the
name and milliseconds for each week and order by the song length with the longest song listed first.?*/

select * from track

select name, milliseconds
from track
where milliseconds > (
select  AVG(milliseconds) as avg_track_length from track)
order by milliseconds desc






