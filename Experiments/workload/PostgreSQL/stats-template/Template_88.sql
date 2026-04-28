SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE v.UserId = u.Id
  AND c.UserId = u.Id
  AND p.OwnerUserId = u.Id
  AND ph.UserId = u.Id
  AND c.Score = ###
  AND p.AnswerCount >= ###
  AND p.AnswerCount <= ###
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp
  AND ph.CreationDate <= &&& :: timestamp
  AND v.BountyAmount >= ###
  AND v.CreationDate >= &&& :: timestamp
  AND u.UpVotes <= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;