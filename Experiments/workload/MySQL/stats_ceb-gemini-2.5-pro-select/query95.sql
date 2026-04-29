WITH v_agg AS
  (SELECT PostId,
          COUNT(*) AS n
   FROM votes
   WHERE CreationDate <= '2014-09-12 00:00:00'
   GROUP BY PostId),
     c_agg AS
  (SELECT PostId,
          COUNT(*) AS n
   FROM comments
   GROUP BY PostId),
     ph_agg AS
  (SELECT PostId,
          COUNT(*) AS n
   FROM postHistory
   GROUP BY PostId)
SELECT SUM(v_agg.n * c_agg.n * ph_agg.n)
FROM v_agg
JOIN c_agg ON v_agg.PostId = c_agg.PostId
JOIN ph_agg ON v_agg.PostId = ph_agg.PostId;