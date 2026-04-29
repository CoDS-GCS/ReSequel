WITH CommentCounts AS
  (SELECT UserId,
          COUNT(*) AS Cnt
   FROM comments
   WHERE Score = 0
   GROUP BY UserId)
SELECT SUM(cc.Cnt)
FROM postHistory AS ph
JOIN CommentCounts AS cc ON ph.UserId = cc.UserId
WHERE ph.PostHistoryTypeId = 1;