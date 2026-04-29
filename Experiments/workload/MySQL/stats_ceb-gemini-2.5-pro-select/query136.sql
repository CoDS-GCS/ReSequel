
SELECT SUM(p.cnt *
             (SELECT COUNT(*)
              FROM comments c
              WHERE c.UserId = u.Id
                AND c.CreationDate >= '2010-08-19 09:33:49'
                AND c.CreationDate <= '2014-08-28 06:54:21') *
             (SELECT COUNT(*)
              FROM badges b
              WHERE b.UserId = u.Id) *
             (SELECT COUNT(*)
              FROM postHistory ph
              WHERE ph.UserId = u.Id))
FROM users u
JOIN
  (SELECT OwnerUserId,
          COUNT(*) AS cnt
   FROM posts
   WHERE PostTypeId = 1
     AND ViewCount >= 0
     AND ViewCount <= 25597
     AND CommentCount >= 0
     AND CommentCount <= 11
     AND FavoriteCount >= 0
   GROUP BY OwnerUserId) AS p ON u.Id = p.OwnerUserId
WHERE u.DownVotes <= 0
  AND u.UpVotes >= 0
  AND u.UpVotes <= 123;