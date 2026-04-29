
SELECT COUNT(*)
FROM comments AS c
INNER JOIN posts AS p ON p.Id = c.PostId
INNER JOIN postLinks AS pl ON p.Id = pl.RelatedPostId
INNER JOIN users AS u ON p.OwnerUserId = u.Id
WHERE c.CreationDate >= '2010-07-21 11:05:37'
  AND c.CreationDate <= '2014-08-25 17:59:25'
  AND u.UpVotes >= 0
  AND u.CreationDate >= '2010-08-21 21:27:38';