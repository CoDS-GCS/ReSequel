WITH post_counts AS
  (SELECT OwnerUserId,
          COUNT(*) AS cnt
   FROM posts
   WHERE Score <= 13
     AND AnswerCount >= 0
     AND AnswerCount <= 4
     AND CommentCount >= 0
     AND FavoriteCount <= 2
   GROUP BY OwnerUserId),
     comment_counts AS
  (SELECT UserId,
          COUNT(*) AS cnt
   FROM comments
   GROUP BY UserId),
     history_counts AS
  (SELECT UserId,
          COUNT(*) AS cnt
   FROM postHistory
   WHERE PostHistoryTypeId = 3
   GROUP BY UserId),
     vote_counts AS
  (SELECT UserId,
          COUNT(*) AS cnt
   FROM votes
   WHERE BountyAmount <= 50
   GROUP BY UserId)
SELECT SUM(p.cnt * c.cnt * ph.cnt * v.cnt)
FROM users u
LEFT JOIN post_counts p ON u.Id = p.OwnerUserId
LEFT JOIN comment_counts c ON u.Id = c.UserId
LEFT JOIN history_counts ph ON u.Id = ph.UserId
LEFT JOIN vote_counts v ON u.Id = v.UserId
WHERE u.DownVotes >= 0
  AND p.OwnerUserId IS NOT NULL
  AND c.UserId IS NOT NULL
  AND ph.UserId IS NOT NULL
  AND v.UserId IS NOT NULL;