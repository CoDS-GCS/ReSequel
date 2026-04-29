
SELECT
STRAIGHT_JOIN COUNT(*)
FROM users AS u
JOIN postHistory AS ph ON u.Id = ph.UserId
JOIN comments AS c ON u.Id = c.UserId
JOIN badges AS b ON u.Id = b.UserId
JOIN votes AS v ON u.Id = v.UserId
WHERE u.UpVotes = 0
  AND ph.PostHistoryTypeId = 12
  AND c.CreationDate >= '2010-07-20 21:37:31';