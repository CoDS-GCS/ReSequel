SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     badges AS b,
     users AS u
WHERE u.Id = b.UserId
  AND u.Id = ph.UserId
  AND u.Id = c.UserId
  AND c.CreationDate <= &&& :: timestamp
  AND u.DownVotes <= ###
  AND u.UpVotes <= ###;