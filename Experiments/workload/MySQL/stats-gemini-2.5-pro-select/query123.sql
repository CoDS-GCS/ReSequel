WITH history_per_user AS
  (SELECT ph.UserId,
          COUNT(*) AS history_count
   FROM postHistory AS ph
   GROUP BY ph.UserId)
SELECT SUM(hpu.history_count)
FROM users AS u
JOIN posts AS p ON p.OwnerUserId = u.Id
JOIN badges AS b ON b.UserId = u.Id
JOIN history_per_user AS hpu ON u.Id = hpu.UserId
WHERE u.CreationDate <= '2014-09-12 22:21:49'
  AND p.AnswerCount >= 0
  AND p.FavoriteCount >= 0
  AND p.CreationDate <= '2014-09-03 03:32:35';