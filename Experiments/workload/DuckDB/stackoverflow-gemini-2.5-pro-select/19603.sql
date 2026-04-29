WITH TopFilteredPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   WHERE PostId IN
       (SELECT Id
        FROM TopFilteredPosts)
   GROUP BY PostId)
SELECT tfp.Id AS PostId,
       tfp.Title,
       tfp.CreationDate,
       u.DisplayName AS OWNER,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM TopFilteredPosts tfp
JOIN Users u ON tfp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON tfp.Id = cc.PostId
ORDER BY tfp.CreationDate DESC;