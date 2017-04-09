.headers on
.mode column

-- GOAL: find album with longest track and its correspondign track name.
-- 
-- select 
--     albums.Title,
--     tracks.Name,
--     max(tracks.milliseconds) 
-- 
-- from 
--     tracks
-- 
-- inner join albums on
--     tracks.AlbumId = albums.AlbumId;


-- GOAL: get (album count, artist) ordered by album count descending
-- 
-- SELECT 
--     count( albums.Title ) as albumCount, artists.Name
-- 
-- FROM 
--     artists 
-- 
-- INNER JOIN albums ON
--     artists.ArtistId=albums.ArtistId
-- 
-- GROUP BY
--     artists.Name
-- 
-- ORDER BY
--     albumCount;



