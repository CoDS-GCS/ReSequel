WITH filtered_users AS
  (SELECT Id
   FROM users
   WHERE Reputation >= 1
     AND Reputation <= 691),
     comment_counts AS
  (SELECT c.UserId,
          COUNT(*) AS n_comments
   FROM comments AS c
   JOIN filtered_users u ON c.UserId = u.Id
   WHERE c.CreationDate >= '2010-08-10 17:55:45'
   GROUP BY c.UserId),
     vote_counts AS
  (SELECT v.UserId,
          COUNT(*) AS n_votes
   FROM votes AS v
   JOIN filtered_users u ON v.UserId = u.Id
   GROUP BY v.UserId)
SELECT SUM(cc.n_comments * vc.n_votes)
FROM comment_counts AS cc
JOIN vote_counts AS vc ON cc.UserId = vc.UserId;