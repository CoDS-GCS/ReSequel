WITH filtered_votes AS
  (SELECT PostId
   FROM votes
   WHERE VoteTypeId = 5),
     filtered_history AS
  (SELECT PostId
   FROM postHistory
   WHERE PostHistoryTypeId = 2),
     user_comments AS
  (SELECT c.PostId
   FROM comments AS c
   JOIN badges AS b ON c.UserId = b.UserId)
SELECT COUNT(*)
FROM posts AS p
JOIN filtered_votes AS v ON p.Id = v.PostId
JOIN filtered_history AS ph ON p.Id = ph.PostId
JOIN postLinks AS pl ON p.Id = pl.RelatedPostId
JOIN user_comments AS uc ON p.Id = uc.PostId
WHERE p.CommentCount >= 0;