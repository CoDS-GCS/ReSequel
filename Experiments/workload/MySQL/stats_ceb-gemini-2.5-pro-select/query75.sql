WITH base AS
  (SELECT p.Id AS PostId,
          u.Id AS UserId
   FROM
     (SELECT Id,
             OwnerUserId
      FROM posts
      WHERE Score >= -4
        AND ViewCount >= 0
        AND ViewCount <= 5977
        AND AnswerCount <= 4
        AND CommentCount >= 0
        AND CommentCount <= 11
        AND CreationDate >= '2011-01-25 08:31:41') AS p
   JOIN
     (SELECT Id
      FROM users
      WHERE Reputation <= 312
        AND DownVotes <= 0) AS u ON p.OwnerUserId = u.Id),
     c_counts AS
  (SELECT PostId,
          COUNT(*) AS n
   FROM comments
   WHERE Score = 0
     AND CreationDate <= '2014-09-09 19:58:29'
   GROUP BY PostId),
     ph_counts AS
  (SELECT PostId,
          COUNT(*) AS n
   FROM postHistory
   GROUP BY PostId),
     v_counts AS
  (SELECT PostId,
          COUNT(*) AS n
   FROM votes
   GROUP BY PostId),
     b_counts AS
  (SELECT UserId,
          COUNT(*) AS n
   FROM badges
   GROUP BY UserId)
SELECT SUM(c.n * ph.n * v.n * b.n)
FROM base
JOIN c_counts c ON base.PostId = c.PostId
JOIN ph_counts ph ON base.PostId = ph.PostId
JOIN v_counts v ON base.PostId = v.PostId
JOIN b_counts b ON base.UserId = b.UserId;