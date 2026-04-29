
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.Score,
       p.ViewCount,
       p.AnswerCount,
       p.CommentCount
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
JOIN
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS p_filtered ON p.Id = p_filtered.Id;