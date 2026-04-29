
SELECT SUM(t.c)
FROM
  (SELECT userid,
          COUNT(*) AS c
   FROM badges
   GROUP BY userid) AS t
JOIN users AS u ON t.userid = u.id
WHERE u.UpVotes >= 0;