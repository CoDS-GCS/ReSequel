
SELECT SUM(T.VoteCount)
FROM
  (SELECT COUNT(p.Id) *
     (SELECT COUNT(*)
      FROM votes v
      WHERE v.UserId = p.OwnerUserId) AS VoteCount
   FROM posts AS p
   JOIN users AS u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 2
     AND p.CreationDate <= '2014-08-26 22:40:26'
     AND u.Views >= 0
   GROUP BY p.OwnerUserId) AS T;