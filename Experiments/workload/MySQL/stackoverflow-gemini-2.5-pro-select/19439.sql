WITH FilteredPostIds AS
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
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
JOIN FilteredPostIds fpi ON p.Id = fpi.Id;