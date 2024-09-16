

------------------------------------------------------
-- Understanding Customer Segmentation and Behavior --
------------------------------------------------------

-- 1. Which customer segments generatethe most revenue?
select 
    case 
    when cus.Company is not null then 'Corporate'
        else 'End Customer'
    end as Segment,
    round(sum(invitem.UnitPrice * invitem.Quantity),2) as TotalRevenue
from customers as cus

join invoices as inv 
    on cus.CustomerId = inv.CustomerId
join invoice_items as invitem
    on inv.InvoiceId = invitem.InvoiceId
group by Segment
order by TotalRevenue desc;


-- 2. Which countries have the highest number of customers and total sales?
select cus.Country,
    count(*) as Amount,
    round(sum(invitem.UnitPrice * invitem.Quantity),2) as TotalRevenue,
    round(count(*)*100/sum(count(*)) over() ,2) as CustomerAmountPercentage
from customers as cus

join invoices as inv 
    on cus.CustomerId = inv.CustomerId
join invoice_items as invitem
    on inv.InvoiceId = invitem.InvoiceId
group by cus.Country
order by TotalRevenue desc
limit 5;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------
---------- Product Analysis and Performance ----------
------------------------------------------------------

-- 1. What are the top-selling genres and artists?

------ 1.1 top-selling genres
select genres.Name, 
    round(sum(invitem.UnitPrice * invitem.Quantity),2) as TotalSales
from genres 

join tracks 
    on genres.GenreId = tracks.GenreId
join invoice_items as invitem
    on tracks.TrackId = invitem.TrackId
group by genres.Name
order by TotalSales desc
limit 10;

------ 1.2 top-selling artists
select artists.Name,
    round(sum(invitem.UnitPrice * invitem.Quantity),2) as TotalSales,
    genres.Name as GenreName,
from artists

join albums 
    on artists.ArtistId = albums.ArtistId
join tracks 
    on albums.AlbumId = tracks.AlbumId
join invoice_items as invitem
    on tracks.TrackId = invitem.TrackId
join genres
    on tracks.GenreId = genres.GenreId
group by artists.Name
order by TotalSales desc
limit 10;


-- 2. What is the sales performance of songs and videos

------ 2.1 group by sub-media type
select type.Name as MediaTypes,
    round(sum(invitem.UnitPrice * invitem.Quantity),2) as TotalSales,
    sum(invitem.Quantity) as TotalQuantity
from invoice_items as invitem

join tracks
    on invitem.TrackId = tracks.TrackId
join media_types as type
    on tracks.MediaTypeId = type.MediaTypeId
group by type.Name
order by TotalSales desc;

------ 2.2 group by meadia type
select
    case 
    when type.Name = 'Protected MPEG-4 video file' then 'Video file'
        else 'Audio file'
    end as MediaTypes,
    round(sum(invitem.UnitPrice * invitem.Quantity),2) as TotalSales,
    sum(invitem.Quantity)  as TotalQuantity
from invoice_items as invitem

join tracks
    on invitem.TrackId = tracks.TrackId
join media_types as type
    on tracks.MediaTypeId = type.MediaTypeId
group by MediaTypes
order by TotalSales desc;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------
----------- Analyzing Employee Performance -----------
------------------------------------------------------

-- 1. Which employees have the highest total sales?
select *
from employees
where Title = 'Sales Support Agent';

select 
    em.FirstName,
    em.LastName,
    round(sum(invitem.UnitPrice * invitem.Quantity),2) as TotalSales,
    count(inv.invoiceid) as InvoiceAmount
from invoice_items as invitem

join invoices as inv
    on invitem.InvoiceId = inv.InvoiceId
join  customers cus
    on inv.CustomerId = cus.CustomerId
join employees as em
    on cus.SupportRepId = em.EmployeeId
where em.Title = 'Sales Support Agent'
group by em.FirstName, em.LastName
order by TotalSales desc;


-- 2. Are there any differences in sales performance between employees in different regions?

------ 2.1 Jane Peacock's performance
select em.FirstName,
  cus.Country,
  round(sum(invitem.UnitPrice * invitem.Quantity),2) as TotalSales,
   count(inv.invoiceid) as InvoiceAmount
from invoice_items as invitem

join invoices as inv
  on invitem.InvoiceId = inv.InvoiceId
join  customers as cus
  on inv.CustomerId = cus.CustomerId
join employees as em
  on cus.SupportRepId = em.EmployeeId
where em.FirstName = 'Jane'
group by em.FirstName, cus.Country 
order by  TotalSales desc
limit 5;

------ 2.2 Margaret Park's performance
select em.FirstName,
  cus.Country,
  round(sum(invitem.UnitPrice * invitem.Quantity),2) as TotalSales,
   count(inv.invoiceid) as InvoiceAmount
from invoice_items as invitem

join invoices as inv
  on invitem.InvoiceId = inv.InvoiceId
join  customers as cus
  on inv.CustomerId = cus.CustomerId
join employees as em
  on cus.SupportRepId = em.EmployeeId
where em.FirstName = 'Margaret'
group by em.FirstName, cus.Country 
order by  TotalSales desc
limit 5;

------ 2.3 Steve Johnson's performance
select em.FirstName,
  cus.Country,
  round(sum(invitem.UnitPrice * invitem.Quantity),2) as TotalSales,
   count(inv.invoiceid) as InvoiceAmount
from invoice_items as invitem

join invoices as inv
  on invitem.InvoiceId = inv.InvoiceId
join  customers as cus
  on inv.CustomerId = cus.CustomerId
join employees as em
  on cus.SupportRepId = em.EmployeeId
where em.FirstName = 'Steve'
group by em.FirstName, cus.Country 
order by  TotalSales desc
limit 5;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
