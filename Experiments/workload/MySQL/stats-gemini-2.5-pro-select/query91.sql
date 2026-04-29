
SELECT SUM(T.p_count * T.ph_count)
FROM
  (SELECT
     (SELECT COUNT(*)
      FROM posts p
      WHERE p.OwnerUserId = u.Id
        AND p.Score >= 0) AS p_count,

     (SELECT COUNT(*)
      FROM postHistory ph
      WHERE ph.UserId = u.Id
        AND ph.CreationDate >= '2010-08-21 05:30:40') AS ph_count
   FROM users u
   WHERE u.Reputation >= 1
     AND u.UpVotes <= 198
     AND u.CreationDate >= '2010-07-19 20:49:05') AS T
WHERE T.p_count > 0
  AND T.ph_count > 0;