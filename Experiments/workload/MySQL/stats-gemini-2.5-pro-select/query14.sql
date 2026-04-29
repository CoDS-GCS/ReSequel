
SELECT SUM(
             (SELECT COUNT(*)
              FROM comments c
              WHERE c.UserId = u.Id
                AND c.CreationDate >= '2010-10-01 20:45:26'
                AND c.CreationDate <= '2014-09-05 12:51:17') *
             (SELECT COUNT(*)
              FROM votes v
              WHERE v.UserId = u.Id
                AND v.BountyAmount <= 100))
FROM users u
WHERE u.UpVotes = 0
  AND u.CreationDate <= '2014-09-12 03:25:34'
  AND EXISTS
    (SELECT 1
     FROM comments c
     WHERE c.UserId = u.Id
       AND c.CreationDate >= '2010-10-01 20:45:26'
       AND c.CreationDate <= '2014-09-05 12:51:17')
  AND EXISTS
    (SELECT 1
     FROM votes v
     WHERE v.UserId = u.Id
       AND v.BountyAmount <= 100);