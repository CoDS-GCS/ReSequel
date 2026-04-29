WITH FilteredPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT fp.Title,
       fp.CreationDate,
       u.DisplayName AS Author,

  (SELECT COUNT(Id)
   FROM Comments
   WHERE PostId = fp.Id) AS CommentCount,

  (SELECT COUNT(Id)
   FROM Votes
   WHERE PostId = fp.Id
     AND VoteTypeId = 2) AS UpVotes,

  (SELECT COUNT(Id)
   FROM Votes
   WHERE PostId = fp.Id
     AND VoteTypeId = 3) AS DownVotes
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
ORDER BY fp.CreationDate DESC;