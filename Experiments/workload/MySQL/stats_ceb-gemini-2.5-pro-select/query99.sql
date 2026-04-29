WITH filtered_user_ids AS
  (SELECT Id
   FROM users
   WHERE Reputation <= 306
     AND UpVotes >= 0)
SELECT SUM(p.p_count * c.c_count * v.v_count)
FROM
  (SELECT OwnerUserId AS UserId,
          COUNT(*) AS p_count
   FROM posts
   WHERE ViewCount >= 0
     AND OwnerUserId IN
       (SELECT Id
        FROM filtered_user_ids)
   GROUP BY OwnerUserId) p
JOIN
  (SELECT UserId,
          COUNT(*) AS c_count
   FROM comments
   WHERE Score = 0
     AND UserId IN
       (SELECT Id
        FROM filtered_user_ids)
   GROUP BY UserId) c ON p.UserId = c.UserId
JOIN
  (SELECT UserId,
          COUNT(*) AS v_count
   FROM votes
   WHERE UserId IN
       (SELECT Id
        FROM filtered_user_ids)
   GROUP BY UserId) v ON c.UserId = v.UserId;