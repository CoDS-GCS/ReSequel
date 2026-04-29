WITH user_posts_count AS
  (SELECT OwnerUserId,
          COUNT(*) AS cnt
   FROM posts
   WHERE PostTypeId = 1
     AND CommentCount >= 0
     AND CommentCount <= 15
   GROUP BY OwnerUserId),
     user_badges_count AS
  (SELECT UserId,
          COUNT(*) AS cnt
   FROM badges
   GROUP BY UserId),
     user_votes_count AS
  (SELECT UserId,
          COUNT(*) AS cnt
   FROM votes
   GROUP BY UserId)
SELECT SUM(p.cnt * b.cnt * v.cnt)
FROM users AS u
JOIN user_posts_count AS p ON u.Id = p.OwnerUserId
JOIN user_badges_count AS b ON u.Id = b.UserId
JOIN user_votes_count AS v ON u.Id = v.UserId
WHERE u.Reputation >= 1
  AND u.DownVotes >= 0
  AND u.DownVotes <= 1;