SELECT COUNT(*)
FROM comments AS c,
     badges AS b,
     users AS u
WHERE c.UserId = u.Id
  AND b.UserId = u.Id
  AND c.CreationDate >= &&& :: timestamp
  AND c.CreationDate <= &&& :: timestamp
  AND u.Views >= ###
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###;