WITH filtered_users AS
  (SELECT Id
   FROM users
   WHERE DownVotes >= 0
     AND DownVotes <= 0
     AND UpVotes >= 0
     AND UpVotes <= 31
     AND CreationDate <= '2014-08-06 20:38:52'),
     counts_c AS
  (SELECT c.UserId,
          COUNT(*) AS n
   FROM comments c
   JOIN filtered_users u ON c.UserId = u.Id
   GROUP BY c.UserId),
     counts_ph AS
  (SELECT ph.UserId,
          COUNT(*) AS n
   FROM postHistory ph
   JOIN filtered_users u ON ph.UserId = u.Id
   GROUP BY ph.UserId),
     counts_b AS
  (SELECT b.UserId,
          COUNT(*) AS n
   FROM badges b
   JOIN filtered_users u ON b.UserId = u.Id
   WHERE b.Date >= '2010-09-26 12:17:14'
   GROUP BY b.UserId),
     counts_v AS
  (SELECT v.UserId,
          COUNT(*) AS n
   FROM votes v
   JOIN filtered_users u ON v.UserId = u.Id
   WHERE v.BountyAmount >= 0
     AND v.CreationDate >= '2010-07-20 00:00:00'
     AND v.CreationDate <= '2014-09-11 00:00:00'
   GROUP BY v.UserId)
SELECT SUM(c.n * ph.n * b.n * v.n)
FROM filtered_users u
JOIN counts_c c ON u.Id = c.UserId
JOIN counts_ph ph ON u.Id = ph.UserId
JOIN counts_b b ON u.Id = b.UserId
JOIN counts_v v ON u.Id = v.UserId;