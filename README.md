# Unveiling Hidden Insights: A Deep Dive into Chinook's Sales Data with SQL

Chinook is a sample database that simulates a digital media store. Derived from real data from the iTunes Library, it contains a randomized four-year sales history. Today, we will use this database as a practical example to practice SQL queries.


This project's instructions were sourced from this link:
[https://www.sqlitetutorial.net/sqlite-sample-database/](https://www.sqlitetutorial.net/sqlite-sample-database/)


### Contents
[ER Diagram](#er-diagram) <br/>
[Business Question](#business-question) <br/>
[Business Recommendations](#business-recommendations) <br/>


## ER Diagram

![sqlite-sample-database-color](https://github.com/user-attachments/assets/294fd8c0-5ed7-4a08-b405-dd650ebd4fe6)


| Table                      | Description                                                                            |
| -------------------------  | -------------------------------------------------------------------------------------- |
| media_types                | table stores media types such as MPEG audio and AAC audio files.                       |
| genres                     | table stores music types such as rock, jazz, metal, etc.                               |
| playlists                  | table stores data about playlists.                                                     |
| playlist_track             | table is used to reflect relationship between playlist and track as a bridge table.    |
| tracks                     | table stores the data of songs. Each track belongs to one album.                       |
| artists                    | table stores artist data. It is a simple table that contains the id and name.          |
| invoices                   | table stores invoice header data of invoice.                                           |
| invoice_items              | table stores the invoice line items data.                                              |
| albums                     | table stores data about a list of tracks                                               |
| customers                  | table stores customer data.                                                            |
| employees                  | table stores employee data such as id, last name, first name, etc.                     |


<br/>

## Business Question
#### Understanding Customer Segmentation and Behavior
- Which customer segments are the most revenue? <br/>
- Which countries have the highest number of customers and total sales? <br/>
- Are there any patterns in customer purchasing behavior (e.g., buying multiple albums by the same artist, purchasing tracks in bundles)? <br/>


#### Product Analysis and Performance
- What are the top-selling genres and artists? <br/>
- What is the average length of tracks? <br/>
- How does the price of a track affect its sales? <br/>
- What is the average selling price of different product categories? <br/>


#### Analyzing Employee Performance
- Which employees have the highest total sales? <br/>
- Are there any differences in sales performance between employees in different regions? <br/>

<br/>

## Business Recommendations

After analyzing using SQL queries, 




