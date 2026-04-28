SELECT COUNT(*)
FROM posts AS p,
     postLinks AS pl,
     postHistory AS ph,
     votes AS v,
     badges AS b,
     users AS u
WHERE p.Id = pl.RelatedPostId
  AND u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND u.Id = ph.UserId
  AND u.Id = v.UserId
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND ph.PostHistoryTypeId = ###
  AND ph.CreationDate <= &&& :: timestamp
  AND v.CreationDate >= &&& :: timestamp
  AND b.Date <= &&& :: timestamp
  AND u.Views >= ###
  AND u.DownVotes >= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;