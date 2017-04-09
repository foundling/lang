.headers on
.mode column

-- goal: get (album count, artist) ordered by album count descending
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


-- goal: get artist from playlists with the most albums

SELECT
    artists.Name

FROM
    playlists

INNER JOIN on artists
    artists.ArtistId=playlists.ArtistId

INNER JOIN on playlist_track
    playlist_track.PlaylistId=playlists.PlaylistId;

GROUP BY
     



