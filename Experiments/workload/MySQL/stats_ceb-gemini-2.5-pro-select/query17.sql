
SELECT SUM(ptc.t_count)
FROM votes v
JOIN
  (SELECT p.OwnerUserId,
          COUNT(*) AS t_count
   FROM posts p
   JOIN tags t ON p.Id = t.ExcerptPostId
   WHERE p.CreationDate >= '2010-07-20 02:01:05'
   GROUP BY p.OwnerUserId) AS ptc ON v.UserId = ptc.OwnerUserId;