
SELECT COUNT(*)
FROM
  (SELECT Id
   FROM posts
   WHERE Score <= 67) AS p
JOIN
  (SELECT PostId,
          UserId
   FROM comments
   WHERE Score = 0) AS c ON p.Id = c.PostId
JOIN
  (SELECT UserId
   FROM badges
   WHERE Date <= '2014-08-20 12:16:56') AS b ON c.UserId = b.UserId
JOIN
  (SELECT PostId
   FROM postHistory
   WHERE PostHistoryTypeId = 34) AS ph ON p.Id = ph.PostId
JOIN votes v ON p.Id = v.PostId
JOIN postLinks pl ON p.Id = pl.RelatedPostId;