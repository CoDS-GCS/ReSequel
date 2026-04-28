SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     votes AS v,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND p.Id = ph.PostId
  AND p.Id = v.PostId
  AND ph.CreationDate >= &&& :: timestamp
  AND p.ViewCount >= ###
  AND p.CommentCount >= ###
  AND v.VoteTypeId = ###
  AND u.Views >= ###
  AND u.Views <= ###
  AND u.UpVotes >= ###;