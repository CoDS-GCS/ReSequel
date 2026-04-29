WITH filtered_user_comments AS
  (SELECT c.UserId,
          COUNT(*) AS comment_count
   FROM comments AS c
   JOIN users AS u ON c.UserId = u.Id
   WHERE c.Score = 1
     AND c.CreationDate >= '2010-07-20 23:17:28'
     AND u.CreationDate >= '2010-07-20 01:27:29'
   GROUP BY c.UserId),
     badge_counts AS
  (SELECT UserId,
          COUNT(*) AS badge_count
   FROM badges
   GROUP BY UserId),
     vote_counts AS
  (SELECT UserId,
          COUNT(*) AS vote_count
   FROM votes
   GROUP BY UserId)
SELECT SUM(fuc.comment_count * bc.badge_count * vc.vote_count)
FROM filtered_user_comments AS fuc
JOIN badge_counts AS bc ON fuc.UserId = bc.UserId
JOIN vote_counts AS vc ON fuc.UserId = vc.UserId;