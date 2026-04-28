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
  AND p.AnswerCount >= ###
  AND p.FavoriteCount >= ###
  AND pl.LinkTypeId = ###
  AND ph.PostHistoryTypeId = ###
  AND v.CreationDate >= &&& :: timestamp
  AND u.Reputation >= ###
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###
  AND u.UpVotes <= ###
  AND u.CreationDate <= &&& :: timestamp;