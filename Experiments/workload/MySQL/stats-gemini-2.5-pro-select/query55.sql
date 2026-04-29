
SELECT COUNT(*)
FROM users AS u
JOIN postHistory AS ph ON u.Id = ph.UserId
JOIN badges AS b ON u.Id = b.UserId
JOIN posts AS p ON u.Id = p.OwnerUserId
JOIN tags AS t ON p.Id = t.ExcerptPostId
WHERE p.CommentCount >= 0
  AND u.DownVotes <= 0
  AND b.Date <= '2014-08-22 02:21:55';