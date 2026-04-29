
SELECT SUM(ucc.cnt)
FROM postHistory AS ph
JOIN
  (SELECT UserId,
          COUNT(*) AS cnt
   FROM comments
   GROUP BY UserId) AS ucc ON ph.UserId = ucc.UserId
WHERE ph.PostHistoryTypeId = 1
  AND ph.CreationDate >= '2010-09-14 11:59:07';