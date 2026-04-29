
SELECT COUNT(*)
FROM users AS u
JOIN comments AS c ON u.Id = c.UserId
AND c.CreationDate >= '2010-07-31 05:18:59'
AND c.CreationDate <= '2014-09-12 07:59:13'
JOIN posts AS p ON u.Id = p.OwnerUserId
AND p.Score >= -2
AND p.ViewCount >= 0
AND p.ViewCount <= 18281
JOIN postHistory AS ph ON u.Id = ph.UserId
AND ph.PostHistoryTypeId = 2
JOIN badges AS b ON u.Id = b.UserId
AND b.Date >= '2010-10-20 08:33:44'
WHERE u.Views >= 0
  AND u.Views <= 75;