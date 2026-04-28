SELECT COUNT(*)
FROM tags AS t,
     posts AS p,
     users AS u,
     votes AS v,
     badges AS b
WHERE p.Id = t.ExcerptPostId
  AND u.Id = v.UserId
  AND u.Id = b.UserId
  AND u.Id = p.OwnerUserId
  AND u.Views >= ###
  AND u.Views <= ###
  AND u.UpVotes >= ###
  AND u.CreationDate <= &&& :: timestamp
  AND v.BountyAmount >= ###
  AND v.BountyAmount <= ###
  AND b.Date <= &&& :: timestamp;