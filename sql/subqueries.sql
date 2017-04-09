.headers on
.mode column

-- GOAL: find average track count for all albums across artists

-- SELECT 
--     avg ( sub.trackCount ) as average,
--     max ( sub.trackCount ) as maximum,
--     min ( sub.trackCount ) as minimum
-- 
-- FROM
--     (
--         SELECT 
--             artists.Name as artist,
--             albums.Title as album,
--             count (tracks.AlbumId) as trackCount
-- 
--         FROM 
--             albums
-- 
--         INNER JOIN tracks on
--             albums.AlbumId = tracks.AlbumId
-- 
--         INNER JOIN artists on
--             albums.ArtistId = artists.ArtistId
-- 
--         GROUP BY
--             tracks.AlbumId
-- 
--     ) sub;



-- GOAL: find average track count across albums for each artist 

SELECT
    sub.artistName as 'Artist Name',
    avg(sub.trackCount) as 'Track Count',
    max(sub.trackCount) as 'Min Tracks',
    min(sub.trackCount) as 'Max Tracks',
    count(sub.albumTitle) as 'Total Albums'

FROM
    (

        SELECT 
            artists.Name as artistName,
            albums.Title albumTitle,
            count( tracks.TrackId ) as trackCount

        FROM
            artists

        INNER JOIN albums on 
            artists.ArtistId = albums.ArtistId

        INNER JOIN tracks on 
            tracks.AlbumId = albums.AlbumId

        GROUP BY 
            albums.AlbumId
    ) sub

GROUP BY sub.artistName
ORDER BY sub.artistName ASC;
