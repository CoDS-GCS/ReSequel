
SELECT COUNT(*)
FROM comments AS c
JOIN users AS u ON u.Id = c.UserId
JOIN posts AS p ON c.PostId = p.Id
JOIN postLinks AS pl ON pl.RelatedPostId = p.Id
JOIN postHistory AS ph ON ph.PostId = p.Id
WHERE c.CreationDate >= '2010-07-11 12:25:05'
  AND c.CreationDate <= '2014-09-11 13:43:09'
  AND p.CommentCount >= 0
  AND p.CommentCount <= 14
  AND pl.LinkTypeId = 1
  AND ph.CreationDate >= '2010-08-06 03:14:53'
  AND u.Reputation >= 1
  AND u.Reputation <= 491
  AND u.DownVotes >= 0
  AND u.DownVotes <= 0;