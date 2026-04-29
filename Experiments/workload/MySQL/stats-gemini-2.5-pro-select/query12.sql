WITH user_counts AS
  (SELECT u.id,

     (SELECT COUNT(*)
      FROM comments
      WHERE UserId = u.id) AS c_count,

     (SELECT COUNT(*)
      FROM postHistory
      WHERE UserId = u.id) AS ph_count
   FROM users u
   WHERE u.Reputation >= 1
     AND u.Reputation <= 487
     AND u.UpVotes <= 27
     AND u.CreationDate >= '2010-10-22 22:40:35'
     AND u.CreationDate <= '2014-09-10 17:01:31')
SELECT SUM(c_count * ph_count)
FROM user_counts
WHERE c_count > 0
  AND ph_count > 0;