
SELECT COUNT(*)
FROM
  (SELECT Id
   FROM users
   WHERE Reputation >= 1) AS u
JOIN
  (SELECT Id,
          OwnerUserId
   FROM posts
   WHERE ViewCount >= 0) AS p ON u.Id = p.OwnerUserId
JOIN badges AS b ON u.Id = b.UserId
JOIN postLinks AS pl ON p.Id = pl.RelatedPostId
JOIN comments AS c ON p.Id = c.PostId
WHERE c.CreationDate <= '2014-09-08 15:58:08';