WITH user_post_counts AS
  (SELECT OwnerUserId,
          COUNT(*) AS PostCount
   FROM posts
   WHERE CommentCount >= 0
   GROUP BY OwnerUserId),
     user_vote_counts AS
  (SELECT UserId,
          COUNT(*) AS VoteCount
   FROM votes
   GROUP BY UserId)
SELECT SUM(upc.PostCount * uvc.VoteCount)
FROM users u
JOIN user_post_counts upc ON u.Id = upc.OwnerUserId
JOIN user_vote_counts uvc ON u.Id = uvc.UserId
WHERE u.CreationDate >= '2010-12-15 06:00:24';