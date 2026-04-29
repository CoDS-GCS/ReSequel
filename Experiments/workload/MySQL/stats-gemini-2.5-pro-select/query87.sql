
SELECT COUNT(*)
FROM users AS u
STRAIGHT_JOIN comments AS c ON u.Id = c.UserId
STRAIGHT_JOIN badges AS b ON u.Id = b.UserId
WHERE u.Views >= 0
  AND u.DownVotes >= 0
  AND u.DownVotes <= 2
  AND c.CreationDate >= '2010-08-12 20:27:30'
  AND c.CreationDate <= '2014-09-12 12:49:19';