WITH c_counts AS
  (SELECT PostId,
          COUNT(*) AS n
   FROM comments
   WHERE Score = 0
     AND CreationDate >= '2010-08-26 06:55:11'
   GROUP BY PostId),
     ph_counts AS
  (SELECT PostId,
          COUNT(*) AS n
   FROM postHistory
   WHERE CreationDate <= '2014-09-05 06:39:25'
   GROUP BY PostId),
     v_counts AS
  (SELECT PostId,
          COUNT(*) AS n
   FROM votes
   WHERE VoteTypeId = 2
   GROUP BY PostId)
SELECT SUM(c.n * ph.n * v.n)
FROM c_counts AS c
JOIN ph_counts AS ph ON c.PostId = ph.PostId
JOIN v_counts AS v ON c.PostId = v.PostId;