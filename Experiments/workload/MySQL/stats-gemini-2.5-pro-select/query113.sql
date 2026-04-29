
SELECT SUM(ucc.n_comments * phc.n_posthistories * bc.n_badges)
FROM
  (SELECT u.Id,
          COUNT(c.Id) AS n_comments
   FROM users AS u
   JOIN comments AS c ON u.Id = c.UserId
   WHERE u.DownVotes <= 0
     AND u.UpVotes <= 47
     AND c.CreationDate <= '2014-09-10 00:33:30'
   GROUP BY u.Id) AS ucc
JOIN
  (SELECT ph.UserId,
          COUNT(*) AS n_posthistories
   FROM postHistory AS ph
   GROUP BY ph.UserId) AS phc ON ucc.Id = phc.UserId
JOIN
  (SELECT b.UserId,
          COUNT(*) AS n_badges
   FROM badges AS b
   GROUP BY b.UserId) AS bc ON ucc.Id = bc.UserId;