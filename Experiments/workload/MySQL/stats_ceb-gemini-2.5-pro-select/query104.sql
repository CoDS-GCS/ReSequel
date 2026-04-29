WITH qualifying_ids AS
  (SELECT u.Id
   FROM users u
   JOIN postHistory ph ON u.Id = ph.UserId
   WHERE u.DownVotes <= 0
     AND u.UpVotes >= 0
     AND u.UpVotes <= 72
     AND ph.CreationDate >= '2010-07-28 09:11:34'
     AND ph.CreationDate <= '2014-09-06 06:51:53'
   GROUP BY u.Id)
SELECT SUM(T1.ph_count * T2.c_count * T3.v_count)
FROM
  (SELECT UserId,
          COUNT(*) AS ph_count
   FROM postHistory
   WHERE UserId IN
       (SELECT Id
        FROM qualifying_ids)
     AND CreationDate >= '2010-07-28 09:11:34'
     AND CreationDate <= '2014-09-06 06:51:53'
   GROUP BY UserId) AS T1
JOIN
  (SELECT UserId,
          COUNT(*) AS c_count
   FROM comments
   WHERE UserId IN
       (SELECT Id
        FROM qualifying_ids)
   GROUP BY UserId) AS T2 ON T1.UserId = T2.UserId
JOIN
  (SELECT UserId,
          COUNT(*) AS v_count
   FROM votes
   WHERE UserId IN
       (SELECT Id
        FROM qualifying_ids)
   GROUP BY UserId) AS T3 ON T1.UserId = T3.UserId;