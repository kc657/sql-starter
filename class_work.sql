SELECT *
FROM Album
Limit 10;

SELECT *
FROM Genre;

-- CUSTOMERS FROM CALIFORNIA BUT NOT FROM MOUNTAIN VIEW
SELECT *
FROM Customer
WHERE State in ('CA','NY') AND City != 'Mountain View';

-- COUNT ALL
SELECT COUNT(*);

-- SONGS THAT ARE LONGER THAN 10 MINUTES
SELECT COUNT(*)
FROM Track
WHERE Milliseconds > 600000;

SELECT CustomerId, BillingAddress, InvoiceDate
FROM Invoice
WHERE InvoiceDate BETWEEN date('2010-01-01') AND date('2010-02-01');

SELECT COUNT(*)
FROM Track
WHERE Composer IS NULL;

SELECT COUNT(DISTINCT title)
FROM Album;

SELECT COUNT(DISTINCT albumId)
FROM Album;

CREATE TABLE IF NOT EXISTS favoriteSongs (
  id INTEGER,
  title VARCHAR(128),
  seconds INTEGER
);

CREATE TABLE IF NOT EXISTS favorite_tracks AS
  SELECT *
  FROM Track
  WHERE genreid=1;

SELECT *
FROM favorite_tracks;

INSERT INTO favoriteSongs
(id, title, seconds)
VALUES (0, 'Call Me Maybe', 193);

SELECT *
FROM favoriteSongs;

DROP TABLE favoriteSongs;

JOIN TABLES

SELECT *
FROM track
Join mediatype
  On track.mediatypeid =
     mediatype.mediatypeid;

SELECT COUNT(*)
FROM Genre
JOIN Track
  On Genre.genreid =
     Track.genreid
Where Genre.name in ('Rock', 'Alternative');
-- can also do WHERE genre.name LIKE '%rock%' or genre.name LIKE '%alternative%'

SELECT COUNT(*)
FROM Artist
JOIN Album
  On Artist.ArtistId = Album.ArtistId
JOIN Track
  On Album.AlbumId = Track.AlbumId
JOIN PlayListTrack
  On Track.TrackId = PlayListTrack.TrackId
Join PlayList
  On PlayListTrack.PlayListId = PlayList.PlayListId
WHERE Artist.name LIKE 'R.E.M.%' AND Artist.name NOT LIKE 'R.E.M.';

SELECT COUNT(Playlist.Name)
FROM Artist
JOIN Album
  On Artist.ArtistId = Album.ArtistId
JOIN Track
  On Album.AlbumId = Track.AlbumId
JOIN PlayListTrack
  On Track.TrackId = PlayListTrack.TrackId
Join PlayList
  On PlayListTrack.PlayListId = PlayList.PlayListId
WHERE Artist.name LIKE 'R.E.M.%';

SELECT SUM(Total) as TotalSale
  FROM Invoice
  WHERE InvoiceDate >= date('2010-01-01') AND InvoiceDate < date('2010-02-01');

SELECT AVG(tr.milliseconds/1000.0/60.0) AS Minutes
  FROM Artist ar
  JOIN Album al
    On ar.ArtistId = al.ArtistId
  JOIN Track tr
    On al.AlbumId = tr.AlbumId
  WHERE ar.name LIKE '%R.E.M.%';

SELECT Composer, Count(*)
  FROM Track tr
  JOIN Genre gr
    ON tr.genreid = gr.genreid
  WHERE gr.name LIKE '%alternative%'
  GROUP BY Composer
  HAVING COUNT(*) > 5 AND COUNT(*) < 10
  ORDER BY COUNT(*) DESC;

SELECT ar.Name, COUNT(*)
  FROM Artist ar
  JOIN Album al
    On ar.ArtistId = al.ArtistId
  JOIN Track tr
    On al.AlbumId = tr.AlbumId
  GROUP BY ar.Name
  ORDER BY COUNT(*) DESC
  LIMIT 10;

SELECT al.Title AS AlbumTitle, SUM(tr.Milliseconds/60.0/1000.0) AS TotalMinutes
  FROM Album al
  JOIN Track tr
    On al.AlbumId = tr.AlbumId
  JOIN MediaType mt
    On tr.MediaTypeId = mt.MediaTypeId
  WHERE mt.Name NOT LIKE '%video%'
  GROUP BY al.Title
  ORDER BY SUM(tr.Milliseconds) DESC
  LIMIT 10;
