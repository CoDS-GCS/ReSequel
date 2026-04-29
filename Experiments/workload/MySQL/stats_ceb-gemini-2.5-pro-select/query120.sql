WITH post_counts AS
  (SELECT OwnerUserId,
          COUNT(*) AS cnt
   FROM posts
   WHERE Score >= 0
   GROUP BY OwnerUserId),
     history_counts AS
  (SELECT UserId,
          COUNT(*) AS cnt
   FROM postHistory
   WHERE CreationDate >= '2010-07-27 02:56:06'
   GROUP BY UserId),
     badge_counts AS
  (SELECT UserId,
          COUNT(*) AS cnt
   FROM badges
   GROUP BY UserId)
SELECT SUM(p.cnt * ph.cnt * b.cnt)
FROM post_counts AS p
JOIN history_counts AS ph ON p.OwnerUserId = ph.UserId
JOIN users AS u ON ph.UserId = u.Id
JOIN badge_counts AS b ON u.Id = b.UserId
WHERE u.CreationDate >= '2010-07-27 02:56:06'
  AND u.CreationDate <= '2014-09-10 10:44:00';