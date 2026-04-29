WITH CommentCounts AS
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   GROUP BY PostId),
     PostsWithCounts AS
  (SELECT p.Id,
          p.Title,
          p.OwnerUserId,
          p.CreationDate,
          p.Score,
          COALESCE(cc.Cnt, 0) AS CommentCount
   FROM Posts p
   LEFT JOIN CommentCounts cc ON p.Id = cc.PostId
   WHERE p.PostTypeId = 1)
SELECT pwc.Id AS PostId,
       pwc.Title,
       u.DisplayName AS OwnerDisplayName,
       pwc.CreationDate,
       pwc.Score,
       pwc.CommentCount
FROM PostsWithCounts pwc
JOIN Users u ON pwc.OwnerUserId = u.Id
ORDER BY pwc.CreationDate DESC
LIMIT 10;