WITH user_comment_counts AS
  (SELECT u.Id AS UserId,
          COUNT(c.Id) AS n_comments
   FROM users AS u
   INNER JOIN comments AS c ON u.Id = c.UserId
   WHERE u.CreationDate >= '2010-07-20 01:27:29'
     AND c.CreationDate >= '2010-07-20 23:17:28'
     AND c.Score = 1
   GROUP BY u.Id),
     vote_counts AS
  (SELECT UserId,
          COUNT(*) AS n_votes
   FROM votes
   GROUP BY UserId),
     badge_counts AS
  (SELECT UserId,
          COUNT(*) AS n_badges
   FROM badges
   GROUP BY UserId)
SELECT SUM(ucc.n_comments * v.n_votes * b.n_badges)
FROM user_comment_counts AS ucc
INNER JOIN vote_counts AS v ON ucc.UserId = v.UserId
INNER JOIN badge_counts AS b ON ucc.UserId = b.UserId;