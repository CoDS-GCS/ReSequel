
SELECT COUNT(*)
FROM comments AS c
INNER JOIN posts AS p ON p.Id = c.PostId
INNER JOIN postLinks AS pl ON p.Id = pl.RelatedPostId
INNER JOIN postHistory AS ph ON p.Id = ph.PostId
INNER JOIN votes AS v ON p.Id = v.PostId
INNER JOIN badges AS b ON b.UserId = c.UserId
WHERE c.Score = 0
  AND p.Score <= 32
  AND p.ViewCount <= 4146
  AND pl.LinkTypeId = 1
  AND v.CreationDate <= '2014-09-10 00:00:00';