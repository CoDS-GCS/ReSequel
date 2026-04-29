WITH post_link_counts AS
  (SELECT p.OwnerUserId,
          COUNT(*) AS c
   FROM posts p
   JOIN postLinks pl ON p.Id = pl.RelatedPostId
   WHERE p.AnswerCount >= 0
     AND p.FavoriteCount >= 0
     AND pl.LinkTypeId = 1
   GROUP BY p.OwnerUserId)
SELECT SUM(plc.c *
             (SELECT COUNT(*)
              FROM badges b
              WHERE b.UserId = u.Id) *
             (SELECT COUNT(*)
              FROM votes v
              WHERE v.UserId = u.Id
                AND v.CreationDate >= '2010-07-20 00:00:00') *
             (SELECT COUNT(*)
              FROM postHistory ph
              WHERE ph.UserId = u.Id
                AND ph.PostHistoryTypeId = 2))
FROM users u
JOIN post_link_counts plc ON u.Id = plc.OwnerUserId
WHERE u.Reputation >= 1
  AND u.DownVotes >= 0
  AND u.DownVotes <= 0
  AND u.UpVotes <= 439
  AND u.CreationDate <= '2014-08-07 11:18:45';