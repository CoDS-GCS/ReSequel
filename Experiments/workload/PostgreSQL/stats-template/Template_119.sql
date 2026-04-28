SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     badges AS b,
     users AS u
WHERE u.Id = ph.UserId
  AND u.Id = b.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = c.UserId
  AND c.CreationDate >= &&& :: timestamp
  AND c.CreationDate <= &&& :: timestamp
  AND p.PostTypeId = ###
  AND p.ViewCount >= ###
  AND p.ViewCount <= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount >= ###
  AND u.DownVotes <= ###
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###;